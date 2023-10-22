#!/bin/bash

VERSION=18.0.3.450
USER=farfui
HOSTNAME=galaxy-srv-3cx.cgsmith.me
REPO=${USER}/3cx:${VERSION}

docker run \
        -d \
        --name 3cx \
        --hostname ${HOSTNAME} \
        --memory 1g \
        --memory-swap 1g \
        --network IPVLAN5 \
        --restart unless-stopped \
        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
        -v /volume1/docker/3cx/backup:/srv/backup \
        -v /volume1/docker/3cx/recordings:/srv/recordings \
        -v /volume1/docker/3cx/log:/var/log \
        --cap-add SYS_ADMIN \
        --cap-add NET_ADMIN \
        ${REPO}
