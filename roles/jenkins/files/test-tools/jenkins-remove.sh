#!/bin/sh

. ./setComposeList.sh
docker-compose rm --force --stop -v jenkins ssh-agent
