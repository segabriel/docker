## Quick Start

    sudo ./build.sh
    sudo ./run.sh

#### to start an interactive BaSH session

    docker run -it --rm -p 6379:6379 segabriel/redis:4.0.2 /sbin/my_init /bin/bash

#### to attach to a running process

    docker exec -it segabriel/redis:4.0.2 /bin/bash

#### To check redis

    redis-cli
    redis-cli -a <password> -h <host> -p <port>"
    > ping

## Problem

    echo 'vm.overcommit_ratio = 100' >> /etc/sysctl.conf
    echo 'vm.overcommit_memory = 2' >> /etc/sysctl.conf
    sed '/^exit 0/d' -i /etc/rc.local
    echo 'echo never > /sys/kernel/mm/transparent_hugepage/enabled' >> /etc/rc.local
    echo 'sysctl -w net.core.somaxconn=65535' >> /etc/rc.local
    echo 'exit 0' >> /etc/rc.local
