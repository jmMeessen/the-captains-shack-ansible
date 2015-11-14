#!/usr/bin/env bash

docker build -t jmm/docker_s3cmd:latest docker-s3cmd/

. ./S3backup_keys.env

# get the backuped host
# get the directory backup
# destination  directory

docker run --rm  \
--env aws_key=$aws_key --env aws_secret=$aws_secret \
--env cmd=sync-s3-to-local \
--env SRC_S3=s3://the-captains-shack.com/ns360684.ip-91-121-164.eu/gogs \
-v /home/jmm/:/opt/dest \
jmm/docker_s3cmd:latest