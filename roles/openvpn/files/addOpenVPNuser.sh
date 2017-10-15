#!/usr/bin/env bash

export OVPN_DATA=ovpn-data
docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full jmm nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient jmm > jmm.ovpn