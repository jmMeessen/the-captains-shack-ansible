#!/usr/bin/env bash

docker volume create --name ovpn-data
xzcat ~/openvpn-backup.tar.xz | docker run -v $OVPN_DATA:/etc/openvpn -i kylemanna/openvpn tar -xvf - -C /etc
