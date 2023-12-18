#!/bin/sh
WAN_IP=$(ifstatus wan | jsonfilter -e '@["ipv4-address"][0].address')
if [[ $WAN_IP =~ ^100+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  #private IP
  logger -t wan-ip $WAN_IP is private IP, restart wan interface
  ifdown wan && ifup wan
else
  # white IP
  logger -t wan-ip $WAN_IP is white IP
  exit 0
fi
