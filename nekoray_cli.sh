#!/bin/sh

# DOWNLOADING NEKORAY FROM GIT-HUB
mkdir -p /ExtremeDOT/nekoray
cd /ExtremeDOT
wget https://github.com/MatsuriDayo/nekoray/releases/download/2.11/nekoray-2.11-2023-01-13-linux64.zip
unzip nekoray-2.11-2023-01-13-linux64.zip
rm /ExtremeDOT/*.zip
cd /ExtremeDOT/nekoray

# /ExtremeDOT/nekoray/nekobox_core version
# cp /usr/local/etc/v2ray/config.json /ExtremeDOT/nekoray/config.json
/ExtremeDOT/nekoray/nekoray_core run -config /ExtremeDOT/nekoray/config.json

