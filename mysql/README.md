## Quick Start

    sudo ./build.sh
    sudo ./run.sh

To create a new database specify the database name in the MYSQL_DATABASE variable.
To create a new user you should specify the MYSQL_USER and MYSQL_PASSWORD variables.

    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION
    GRANT ALL PRIVILEGES ON `${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%'
    GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_REMOTE_ROOT_NAME}'@'${MYSQL_REMOTE_ROOT_HOST}' WITH GRANT OPTION

#### To connect mysql

    mysql -u root -p

#### To see all users and their host

    SELECT User,Host FROM mysql.user;

#### To show grants by user

    SHOW GRANTS FOR '${USER_NAME}'@'${HOST}';

#### To show all databases

    SHOW DATABASES;

#### To create new user

    CREATE USER '${NEW_USER}'@'${HOST}' IDENTIFIED BY '${NEW_USER_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO '${NEW_USER}'@'${HOST}';
    FLUSH PRIVILEGES;
