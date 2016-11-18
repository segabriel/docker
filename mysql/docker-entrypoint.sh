#!/bin/bash
set -e

MYSQL_VOLUME_HOME=${MYSQL_VOLUME_HOME:-"/var/lib/mysql"}

MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD:-}

MYSQL_USER=${MYSQL_USER:-}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-}
MYSQL_DATABASE=${MYSQL_DATABASE:-}

MYSQL_REMOTE_ROOT_NAME=${MYSQL_REMOTE_ROOT_NAME:-}
MYSQL_REMOTE_ROOT_PASS=${MYSQL_REMOTE_ROOT_PASS:-}
MYSQL_REMOTE_ROOT_HOST=${MYSQL_REMOTE_ROOT_HOST:-"172.17.0.1"}

if [[ ! -d ${MYSQL_VOLUME_HOME}/mysql ]]; then
    echo "=> An empty or uninitialized MySQL volume is detected in $MYSQL_VOLUME_HOME"

    if [ -z ${MYSQL_ROOT_PASSWORD} ]; then
		echo >&2 'error: database is uninitialized and password option is not specified '
		echo >&2 '=> You need to specify MYSQL_ROOT_PASSWORD '
		exit 1
	fi

	mkdir -p ${MYSQL_VOLUME_HOME}
	chown -R mysql:mysql ${MYSQL_VOLUME_HOME}

	echo '=> Initializing database'

    # Try the 'preferred' solution
    mysqld --initialize-insecure > /dev/null 2>&1
    # IF that didn't work
    if [ $? -ne 0 ]; then
        # Fall back to the 'depreciated' solution
        mysql_install_db > /dev/null 2>&1
    fi

    echo "=> Done!"

    /usr/bin/mysqld_safe > /dev/null 2>&1 &

    mysql=( mysql --protocol=socket -uroot -hlocalhost)

    for i in {30..0}; do
		if echo 'SELECT 1' | "${mysql[@]}" &> /dev/null; then
			break
		fi
		echo '=> MySQL init process in progress...'
		sleep 1
	done
	if [ "$i" = 0 ]; then
		echo >&2 '=> MySQL init process failed.'
		exit 1
	fi

	"${mysql[@]}" <<-EOSQL
		-- What's done in this file shouldn't be replicated
		--  or products like mysql-fabric won't work
		SET @@SESSION.SQL_LOG_BIN=0;
		DELETE FROM mysql.user ;
		DROP USER root@localhost ;
		CREATE USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' ;
		GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION ;
		DROP DATABASE IF EXISTS test ;
		FLUSH PRIVILEGES ;
	EOSQL

	if [ ! -z "$MYSQL_ROOT_PASSWORD" ]; then
		mysql+=( -p"${MYSQL_ROOT_PASSWORD}" )
	fi

    if [ -z "$MYSQL_ROOT_PASSWORD" ]; then
		echo >&2 'error: database is uninitialized and password option is not specified '
		echo >&2 '=> You need to specify MYSQL_ROOT_PASSWORD '
		exit 1
	fi

	if [ -n "${MYSQL_REMOTE_ROOT_NAME}" -a -n "${MYSQL_REMOTE_ROOT_HOST}" ]; then
		echo "=> Creating remote user \"${MYSQL_REMOTE_ROOT_NAME}\" with root privileges..."
		"${mysql[@]}" <<-EOSQL
			CREATE USER '${MYSQL_REMOTE_ROOT_NAME}'@'${MYSQL_REMOTE_ROOT_HOST}' IDENTIFIED BY '${MYSQL_REMOTE_ROOT_PASS}' ;
			GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_REMOTE_ROOT_NAME}'@'${MYSQL_REMOTE_ROOT_HOST}' WITH GRANT OPTION ;
			FLUSH PRIVILEGES ;
		EOSQL
	fi

	if [ "$MYSQL_DATABASE" ]; then
		echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\` ;" | "${mysql[@]}"
		mysql+=( "$MYSQL_DATABASE" )
	fi

	if [ "$MYSQL_USER" -a "$MYSQL_PASSWORD" ]; then
		echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" | "${mysql[@]}"
		if [ "$MYSQL_DATABASE" ]; then
			echo "GRANT ALL ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" | "${mysql[@]}"
		fi
		echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
	fi

    echo
	echo '=> MySQL init process done. Ready for start up.'
	echo

	mysqladmin -uroot -p${MYSQL_ROOT_PASSWORD} shutdown

else
    echo "=> Booting on existing volume!"
fi

exec "$@"
