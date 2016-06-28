#!/usr/bin/env bash
export VPN_DATA="ovpn-data"
docker run --name $OVPN_DATA -v /etc/openvpn busybox
docker run --volumes-from $OVPN_DATA --rm kylemanna/openvpn ovpn_genconfig -u udp://vpn.the-captains-shack.com
docker run --volumes-from $OVPN_DATA --rm -it kylemanna/openvpn ovpn_initpki
