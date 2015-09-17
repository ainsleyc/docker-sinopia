#!/bin/bash

if [ -z $SINOPIA_CONFIG ]; then
  echo "You need to set SINOPIA_CONFIG"
  exit 1
fi

# Get config file
mkdir -p /opt/sinopia
curl -s $SINOPIA_CONFIG > /opt/sinopia/config.yaml

echo "Received sinopia config:"
cat /opt/sinopia/config.yaml

echo "Current user:"
whoami

echo "Base directory:"
ls -lrt /opt/sinopia

echo "Storage:"
ls -lrt /opt/sinopia/storage

echo "Write to storage:"
touch /opt/sinopia/storage/test

echo "Auth:"
ls -lrt /opt/sinopia/auth

echo "Write to Auth:"
touch /opt/sinopia/auth/test

echo "Write to storage:"

node /opt/sinopia/node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
