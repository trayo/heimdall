#!/bin/bash

set -e

TIME=$1
BASEDIR=$(dirname $0)

if [ -z $1 ]; then
  TIME=8h
fi

ssh-add -t $TIME $BASEDIR/.ssh/id_rsa
