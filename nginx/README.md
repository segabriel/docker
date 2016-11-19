## Quick Start

    sudo ./build.sh
    sudo ./run.sh

#### to start an interactive BaSH session

    docker run -it --rm -p 80:80 segabriel/nginx:1.11.6 /sbin/my_init /bin/bash

#### to attach to a running process segabriel/nginx:1.11.6 /bin/bash

    docker exec -it

#### To check installed modules

    nginx -V

#### To reload nginx

    nginx -s reload
