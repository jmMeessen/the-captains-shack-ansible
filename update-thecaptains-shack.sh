#!/usr/bin/env bash

ansible-playbook configure-shack.yml -u jmm --limit kimsufi --ask-vault
