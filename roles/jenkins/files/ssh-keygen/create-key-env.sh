#!/usr/bin/env sh

value=`cat slavery-id_rsa.pub`
echo "JENKINS_SLAVE_SSH_PUBKEY=${value}" > slave-keys.env
