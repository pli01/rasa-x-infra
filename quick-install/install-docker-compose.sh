#!/bin/bash
# install
test -f proxy.sh && source proxy.sh
curl_args=" -H Cache-Control:no-cache "
curl $curl_args -sSL -o install.sh https://storage.googleapis.com/rasa-x-releases/0.37.1/install.sh
[ -s install.sh ] ||{ echo "Error" ; exit 1; }
chmod +x ./install.sh

# fix sudo variable
# fix pip with python3.5 (debian)
# force confirm license
perl -pi.orig -e 's/sudo/sudo -E/g' install.sh
perl -pi.orig -e 's|https://bootstrap.pypa.io/get-pip.py|https://bootstrap.pypa.io/pip/3.5/get-pip.py|g' install.sh
perl -pi.orig  -e's/-c local/-c local -e "terms_confirmed=True"/g' install.sh

sudo -E bash ./install.sh

# start
export RASA_TELEMETRY_ENABLED=false

cd /etc/rasa
docker-compose up -d

# Set your admin password
python3 rasa_x_commands.py create --update admin me AdminMe
