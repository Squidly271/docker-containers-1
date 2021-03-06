#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/config.yaml ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /opt/plexReport/etc/config.yaml.example /config/config.yaml
  chown nobody:users /config/config.yaml
fi

# Check if crons.conf exists. If not, copy in the sample config
if [ -f /config/crons.conf ]; then
  echo "Using existing cron file."
else
  echo "Creating cron from template."
  cp /root/crons.conf /config/crons.conf
  chown nobody:users /config/crons.conf
fi
