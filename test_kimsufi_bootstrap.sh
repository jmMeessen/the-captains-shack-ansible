#!/usr/bin/env bash

./reset_known_host.sh

ansible-playbook test-configure-shack.yml -u root --ask-pass -c ssh --limit kimsufi --ask-vault
