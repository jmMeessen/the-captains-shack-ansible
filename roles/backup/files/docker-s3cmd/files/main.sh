#!/bin/sh -x

#
# main entry point to run s3cmd
#

#
# Check for required parameters
#
if [ -z "${aws_key}" ]; then
    echo "ERROR: The environment variable key is not set."
    exit 1
fi

if [ -z "${aws_secret}" ]; then
    echo "ERROR: The environment variable secret is not set."
    exit 1
fi

if [ -z "${cmd}" ]; then
    echo "ERROR: The environment variable cmd is not set."
    exit 1
fi

#
# Replace key and secret in the /.s3cfg file with the one the user provided
#
echo "" >> /.s3cfg
echo "access_key=${aws_key}" >> /.s3cfg
echo "secret_key=${aws_secret}" >> /.s3cfg


#
# Get the name of the server hosting the docker containers
#
dockerHost_name_long=`cat /opt/ro_etc/hostname`
#We just take the first part of the string
dockerHost_name=`expr "$dockerHost_name_long" : '^\(.[a-zA-Z0-9]*\)'`
if [ -z "${dockerHost_name}" ]; then echo "Node name not correctly retrieved"; exit 1; fi


#
# sync-s3-to-local - synch from s3 to local
#
if [ "${cmd}" = "sync-s3-to-local" ]; then
    echo ${src-s3}
    s3cmd --config=/.s3cfg  sync ${SRC_S3} /opt/dest/
fi

#
# sync-local-to-s3 - synch from local to s3
#
if [ "${cmd}" = "sync-local-to-s3" ]; then
    backup_destination=${backup_root_name}${dockerHost_name}${backup_target_dir}
    echo "Backup destination: ${backup_destination}"
    s3cmd --config=/.s3cfg sync /opt/src/ ${backup_destination}
fi

#
# copy-local-to-s3 - copy from local to s3
#
if [ "${cmd}" = "copy-local-to-s3" ]; then
    backup_destination=${backup_root_name}${dockerHost_name}${backup_target_dir}
    echo "Backup destination: ${backup_destination}"
    if [ -z "${file_to_copy}" ]; then echo "ERROR: The environment variable file_to_copy is not set."; exit 1; fi
    s3cmd --config=/.s3cfg put --storage-class=STANDARD_IA /opt/src/${file_to_copy} ${backup_destination}
fi

#
# Finished operations
#
echo "Finished s3cmd operations"