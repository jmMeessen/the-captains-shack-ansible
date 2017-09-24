#!/bin/sh

./jenkins-stop.sh
./jenkins-remove.sh
./jenkins-volume-reset.sh
./jenkins-rebuild.sh
./jenkins-start.sh
