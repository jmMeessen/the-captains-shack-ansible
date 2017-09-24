#!/bin/sh

. ./setComposeList.sh
docker-compose build --no-cache --pull jenkins ssh-agent
