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

node /opt/sinopia/node_modules/sinopia/bin/sinopia --config /opt/sinopia/config.yaml
