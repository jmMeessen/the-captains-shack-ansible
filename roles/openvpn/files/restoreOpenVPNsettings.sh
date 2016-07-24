#!/usr/bin/env bash

#!/bin/bash

docker volume create --name ovpn-data
xzcat ~/openvpn-backup.tar.xz | docker run --rm  -v ovpn-data:/etc/openvpn -i busybox tar -xvf - -C /etc