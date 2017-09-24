#!/usr/bin/env bash

ansible-playbook test-configure-jenkins.yml -u jmm --limit kimsufi --ask-vault
