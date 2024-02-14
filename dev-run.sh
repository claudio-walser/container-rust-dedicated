#!/bin/bash

podman rm -f rust-dedicated
podman  run -it -d --net=host -v /var/home/claudio/podman/rust:/steamcmd/rust:z -e RUST_OXIDE_ENABLED=1 --name rust-dedicated rust-dedicated:dev
