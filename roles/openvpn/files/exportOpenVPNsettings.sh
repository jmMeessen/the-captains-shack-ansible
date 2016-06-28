#!/usr/bin/env bash
export OVPN_DATA="ovpn-data"
if [ ! -d ~/openVPN ];
then
    mkdir ~/openVPN
fi
docker run --volumes-from $OVPN_DATA --rm busybox tar -cvf - -C /etc openvpn | xz > ~/openVPN/openvpn-backup.tar.xz


