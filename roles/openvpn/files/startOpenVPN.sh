#!/usr/bin/env bash
export OVPN_DATA="ovpn-data"
docker run --volumes-from $OVPN_DATA -d -p 1194:1194/udp --restart=unless-stopped --cap-add=NET_ADMIN kylemanna/openvpn
