#!/bin/bash
# ROOT CONDITIONS
function isRoot() {
        if [ "$EUID" -ne 0 ]; then
                return 1
        fi
}

if ! isRoot; then
        echo "Sorry, you need to run this as root"
        exit 1
fi
clear
echo " X-UI, a multi-user Xray graphical management panel" 
echo ""
echo " Based on https://seakfind.github.io/2021/10/10/X-UI/"
echo ""
echo ""
EMAILADD="123@gmail.com"
read -e -i "$EMAILADD" -p "Enter Email Address: " input
EMAILADD="${input:-$EMAILADD}"

echo ""
DOMAINNM="mydomain.com"
read -e -i "$DOMAINNM" -p "Enter Domain name: " input
DOMAINNM="${input:-$DOMAINNM}"
echo ""

apt update && apt upgrade -y
sleep 1
apt install curl socat -y
sleep 1
curl https://get.acme.sh | sh
sleep 1
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
sleep 1
~/.acme.sh/acme.sh --register-account -m $EMAILADD
sleep 1
~/.acme.sh/acme.sh --issue -d $DOMAINNM --standalone
sleep 1
~/.acme.sh/acme.sh --installcert -d $DOMAINNM --key-file /root/private.key --fullchain-file /root/cert.crt
sleep 1

echo " Installing VaXilue V2ray Panel"
bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
echo " finsih"
