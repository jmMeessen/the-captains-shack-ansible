#!/bin/sh

. ./setComposeList.sh
docker-compose rm --force --stop jenkins ssh-agent
