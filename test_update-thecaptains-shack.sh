#!/usr/bin/env bash

ansible-playbook test-configure-shack.yml -u jmm --limit kimsufi --ask-vault
