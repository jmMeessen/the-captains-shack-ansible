#!/usr/bin/env bash

cd /var/backup
docker-compose run --rm backup_gogs
docker-compose run --rm backup_letsencrypt