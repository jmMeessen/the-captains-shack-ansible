#!/usr/bin/env bash

ssh-keygen -R 5.135.185.7
ssh-keygen -R the-captains-shack.com

ssh-keyscan -t rsa,dsa the-captains-shack.com >> ~/.ssh/known_hosts
ssh-keyscan -t rsa,dsa 5.135.185.7 >> ~/.ssh/known_hosts

