#!/usr/bin/env bash
export OVPN_DATA="ovpn-data"
if [ ! -d ~/openVPN ];
then
    mkdir ~/openVPN
fi
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn tar -cvf - -C /etc openvpn | xz > openvpn-backup.tar.xz
