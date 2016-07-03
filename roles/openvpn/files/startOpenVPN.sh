#!/usr/bin/env bash
export OVPN_DATA="ovpn-data"
docker run -v ${OVPN_DATA}:/etc/openvpn  -d -p 1194:1194/udp --restart=unless-stopped --cap-add=NET_ADMIN kylemanna/openvpn