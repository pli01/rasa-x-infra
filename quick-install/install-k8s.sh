#!/bin/bash
test -f proxy.sh && source proxy.sh
curl_args=" -H Cache-Control:no-cache "
curl $curl_args -o install.sh -s get-rasa-x.rasa.com
[ -s install.sh ] ||{ echo "Error" ; exit 1; }
chmod +x install.sh

# fix export variable with sudo
perl -pi.orig -e 's/sudo/sudo -E/g' install.sh

export DISABLE_TELEMETRY="true"
export INITIAL_USER_PASSWORD="AdminMe"
export ADDITIONAL_CHANNEL_CREDENTIALS="rest=''"
export ENABLE_DUCKLING="true"

# configure k3s data dir and cidr
export INSTALL_K3S_EXEC="$INSTALL_K3S_EXEC --cluster-cidr 192.168.1.0/24 --service-cidr 192.168.2.0/24"
# export INSTALL_K3S_EXEC="$INSTALL_K3S_EXEC --data-dir /DATA/master/k3s"

# start
sudo -E ./install.sh
