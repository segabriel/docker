## Quick Start

    sudo ./build.sh
    sudo ./run.sh

#### to start an interactive BaSH session

    docker run -it --rm -p 80:80 segabriel/nginx:1.11.6 /sbin/my_init /bin/bash

#### to attach to a running process

    docker exec -it segabriel/nginx:1.11.6 /bin/bash

#### To check installed modules

    nginx -V

#### To reload nginx

    nginx -s reload
