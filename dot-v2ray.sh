#!/bin/bash
# ROOT CONDITIONS
YELLOW='\033[0;33m'	# YELLOW
RED='\033[0;31m'        # Red
BLUE='\033[1;34m'       # LIGHTBLUE
GREEN='\033[0;32m'      # Green
NC='\033[0m'            # No Color

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
clear
echo " Extreme DOT V2ray Panel Setup V1.0 " 
echo "----------------------------------------"
PS3=" $(echo $'\n'-----------------------------$'\n' "   Enter Option: " ) "
echo ""
options=(
"A: Update the Linux Machine to Latest"
"B: Install XanMod Kernel , bbr included"
"C: Install ACME Certificate"
"D: Install English V2Ray Panel [proxykingdev] "
"E: BackUP current Server X-UI files"
"CLEAR" "Quit")

select opt in "${options[@]}"
do
case $opt in

"A: Update the Linux Machine to Latest")
echo "" ; echo "Updating System"
apt-get update
apt-get -y upgrade
echo "" ; echo "Please reboot the system."
;;

"B: Install XanMod Kernel , bbr included")
echo "" ; echo "Installing XanMod Kernel"
apt install curl
echo "" ; echo "Downloading the XanMod repository files..."
curl -fSsL https://dl.xanmod.org/gpg.key | gpg --dearmor | tee /usr/share/keyrings/xanmod.gpg > /dev/null && sleep 1
echo 'deb [signed-by=/usr/share/keyrings/xanmod.gpg] http://deb.xanmod.org releases main' | tee /etc/apt/sources.list.d/xanmod-kernel.list && sleep 1
grep xanmod /etc/apt/sources.list.d/xanmod-kernel.list && sleep 1
echo "" ; echo "Updating System... starting."
apt -y update
apt -y upgrade
echo "" ; echo "Updating System... finished."

        echo ""
        echo "What XanMod Kernel Version want to install? ?"
        echo "   1) Stable XanMod Kernel Release"
        echo "   2) Latest Kernel XanMod EDGE (recommended for the latest kernel)"
        echo "   3) XanMod LTS (Kernel 5.15 LTS) "
        echo "   
        until [[ $KERNINSTAL =~ ^[0-3]+$ ]] && [ "$KERNINSTAL" -ge 1 ] && [ "$KERNINSTAL" -le 3 ]; do
                read -rp "KERNINSTAL [1-3]: " -e -i 2 KERNINSTAL
        done
        case $KERNINSTAL in
        1) # Stable XanMod Kernel Release
        echo "" $$ echo "Stable XanMod Kernel Install.."
        apt install linux-xanmod
                ;;
        2) # Latest Kernel XanMod EDGE
        echo "" $$ echo "Latest Kernel XanMod EDGE Install.."
        apt install linux-xanmod-edge
                ;;
        3) # XanMod LTS
        echo "" $$ echo "XanMod LTS Install.."
        apt install linux-xanmod-lts       
                ;;
echo "" && echo " Kernel has installed ..."
echo "" && echo " updating system ..."
apt install -y intel-microcode iucode-tool
sleep 1
apt update
apt -y upgrade
echo "" ; echo "Please reboot the system."

;;

"C: Install ACME Certificate")
echo ""
EMAILADD=""
read -e -i "$EMAILADD" -p "Enter Email Address: " input
EMAILADD="${input:-$EMAILADD}"

echo ""
DOMAINNM=""
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
echo ""
echo "Certfiles are copied to :"
echo ""
echo "/root/cert.crt"
echo "/root/private.key"
;;

"D: Install English V2Ray Panel [proxykingdev] ")
clear
echo""
echo "Installing proxykingdev X-UI Panel"
echo " GITUHB: https://github.com/proxykingdev/x-ui "
echo ""
mkdir -p /tmp/v2Server
cd /tmp/v2Server
wget --no-check-certificate -O install https://raw.githubusercontent.com/proxykingdev/x-ui/master/install
sleep 1
chmod +x install
/tmp/v2Server/./install
;;

"E: BackUP current Server X-UI files")
clear
echo ""
echo -e "${RED} Do you want to clean current backup files ${NC}"
echo ""
until [[ $CLEAN_BACKUP =~ (y|n) ]]; do
read -rp "Delete Backups? [y/n]: " -e -i n CLEAN_BACKUP
done
if [[ $CLEAN_BACKUP == "y" ]]; then
echo -e "${RED} Cleaning Backup Folder${NC}"
rm -rf /dot_migrate_xui
fi
mkdir -p /dot_migrate_xui
sleep 1
cp /usr/local/x-ui/bin/config.json /dot_migrate_xui/config.json
cp /etc/x-ui/x-ui.db /dot_migrate_xui/x-ui.db
echo " Now, Download WinSCP programs"
echo " Connect to this server and download 2 files from /dot_migrate_xui folder "
echo ""
echo -e "${GREEN} /dot_migrate_xui/x-ui.db"
echo -e "/dot_migrate_xui/config.json ${NC}"
echo " finsih"
;;

