#!/usr/bin/env bash

./reset_known_host.sh

ansible-playbook configure-shack.yml -u root --ask-pass -c ssh --limit kimsufi --ask-vault
