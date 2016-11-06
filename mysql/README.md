## Quick Start

    sudo ./build.sh
    sudo ./run.sh

To create a new database specify the database name in the MYSQL_DATABASE variable.
To create a new user you should specify the MYSQL_USER and MYSQL_PASSWORD variables.

    GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION
    GRANT ALL PRIVILEGES ON `${MYSQL_DATABASE}`.* TO '${MYSQL_USER}'@'%'

## Helpful docker commands

#### To see docker logs

    docker logs -f ${MYSQL_CONTAINER_NAME}

#### To inspect docker container

    docker inspect ${MYSQL_CONTAINER_NAME}

#### To stop docker container

    docker stop ${MYSQL_CONTAINER_NAME}

#### To remove docker container

    docker rm ${MYSQL_CONTAINER_NAME}

#### To see all active containers

    docker ps

#### To see all containers

    docker ps -a

#### To stop all containers

    docker stop $(docker ps -aq)

#### To remove all containers

    docker rm $(docker ps -aq)

#### To remove an image

    docker rmi -f IMAGE_ID

#### To remove all images

    docker rmi -f $(docker images -q)

## Shell Access

For debugging and maintenance purposes you may want access the containers shell.

    docker exec -it mysql /bin/bash

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
