#!/bin/sh

. ./setComposeList.sh
docker-compose up -d jenkins ssh-agent
