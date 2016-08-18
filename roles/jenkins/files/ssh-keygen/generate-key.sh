#!/usr/bin/env sh

if [ ! -f /ssh-keys/id_rsa.pub ]
then
  echo "creating ssh-keys"
  mkdir /ssh-keys
  ssh-keygen -t rsa -N '' -f /ssh-keys/id_rsa
else
  echo "Key file already exists, skipping creation..."
fi
chown 1000:1000 --verbose /ssh-keys/id_rsa.pub
chown 1000:1000 --verbose /ssh-keys/id_rsa