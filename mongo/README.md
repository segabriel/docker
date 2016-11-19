## Quick Start

    sudo ./build.sh
    sudo ./run.sh

#### to start an interactive BaSH session

    docker run -it --rm -p 27017:27017 segabriel/mongo:3.3.15 /sbin/my_init /bin/bash

#### to attach to a running process segabriel/mongo:3.3.15 /bin/bash

    docker exec -it

#### To connect mongodb

    mongo

#### To see mongodb version

    db.version();
