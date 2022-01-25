#!/bin/bash

if [ -z "$(ls -A /etc/wireguard)" ]; then
  mv /*.conf /etc/wireguard
  echo "Moved conf file to /etc/wireguard"
else
  rm /*.conf
  echo "Removed unneeded conf file"
fi

wg-quick up wg0
chmod u+x /opt/wgdashboard/wgd.sh
if [ ! -f "/opt/wgdashboard/wg-dashboard.ini" ]; then
  /opt/wgdashboard/wgd.sh install
fi
/opt/wgdashboard/wgd.sh debug

