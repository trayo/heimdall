#!/bin/bash

set -e

TIME=8h
BASEDIR=$(dirname $0)

ssh-add -t $TIME $BASEDIR/.ssh/id_rsa
