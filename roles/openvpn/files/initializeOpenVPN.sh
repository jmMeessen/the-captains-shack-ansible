#!/usr/bin/env bash
export OVPN_DATA="ovpn-data"

#docker run --name $OVPN_DATA -v /etc/openvpn busybox
#docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.the-captains-shack.com
#docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki

docker volume create --name ${OVPN_DATA}
docker run -v ${OVPN_DATA}:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.the-captains-shack.com
docker run -v ${OVPN_DATA}:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
