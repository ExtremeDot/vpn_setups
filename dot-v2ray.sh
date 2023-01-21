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

echo " Extreme DOT V2ray Panel Setup V1.3 " 
echo "----------------------------------------"
PS3=" $(echo $'\n'-----------------------------$'\n' "   Enter Option: " ) "
echo -e "${GREEN}Current Installed Kernel= `cat /proc/version | sed 's/.(.*//'`${NC}"
echo ""
options=(
"A: Update the Linux Machine to Latest"
"B: Install XanMod Kernel , bbr included"
"C: Install ACME Certificate"
"D: Install English V2Ray Panel [proxykingdev] "
"E: BackUP current Server X-UI files"
"F: Restore X-UI files from backup folder"
"G: Reboot the Linux"
"Check for Updates"
"CLEAR"
"Quit"
)

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
echo " "
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
esac

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
mkdir -p /dot_migrate_xui/backup/
clear
echo ""
if test -f "/dot_migrate_xui/x-ui.db"; then
echo -e "${YELLOW} Backup files are found! ${NC}"
echo ""
echo "Moving latest backup files into /dot_migrate_xui/backup folder"
dateformate=$(date '+%Y-%m-%d_%H:%M')
mv "/dot_migrate_xui/config.json" "/dot_migrate_xui/backup/$dateformate-config.json"
mv "/dot_migrate_xui/x-ui.db" "/dot_migrate_xui/backup/$dateformate-x-ui.db"
echo " files are moved into /dot_migrate_xui/backup/"
echo "$dateformate-config.json AND $dateformate-x-ui.db"
echo ""
fi
sleep 1
cp /usr/local/x-ui/bin/config.json /dot_migrate_xui/config.json
cp /etc/x-ui/x-ui.db /dot_migrate_xui/x-ui.db
echo "" ;  echo -e "${GREEN}Files are backed up in ${YELLOW}/dot_migrate_xui/ ${GREEN}folder ${NC}"
echo " Now you can download files using ${YELLOW}WinSCP${NC} program"
echo " Connect to this server and download 2 files from /dot_migrate_xui folder "
echo ""
echo -e "${GREEN} /dot_migrate_xui/x-ui.db"
echo -e "/dot_migrate_xui/config.json ${NC}"
echo " finsih"
;;

"F: Restore X-UI files from backup folder")
mkdir -p /dot_migrate_xui/backup/
echo -e "${YELLOW} Backup files are found! ${NC}"
echo ""
echo -e "${GREEN}Do you want to make backup of them and ${RED}DELETE ${GREEN} ?${NC}"
until [[ $CLEAN_BACKUP1 =~ (y|n) ]]; do
read -rp "Backup and then Delete ? [y/n]: " -e -i y CLEAN_BACKUP1
done
if [[ $CLEAN_BACKUP1 == "y" ]]; then
echo "Moving files into backup and cleaning config.json and x-ui.db"
dateformate=$(date '+%Y-%m-%d_%H:%M')
mv "/dot_migrate_xui/config.json" "/dot_migrate_xui/backup/$dateformate-config.json"
mv "/dot_migrate_xui/x-ui.db" "/dot_migrate_xui/backup/$dateformate-x-ui.db"
fi
echo ""
echo -e "Upload files into server using ${YELLOW}WinSCP${NC} program ${NC}"
echo -e "Upload ${YELLOW}config.json${NC} and ${YELLOW}x-ui.db${NC} into ${GREEN}/dot_migrate_xui/ folder${NC}"
until [[ $UPLOAD_BACKUP1 =~ (y|n) ]]; do
read -rp "Do you uploaded files into server ? [y/n]: " -e -i y UPLOAD_BACKUP1
done
if [[ $UPLOAD_BACKUP1 == "y" ]]; then
echo "Restoring config.json and x-ui.db into X-UI panel"
cp /usr/local/x-ui/bin/config.json /dot_migrate_xui/config.json
cp /etc/x-ui/x-ui.db /dot_migrate_xui/x-ui.db
fi
;;

"Check for Updates")
cd /tmp && curl -O https://raw.githubusercontent.com/ExtremeDot/vpn_setups/master/dot-v2ray.sh
mv /tmp/dot-v2ray.sh /bin/DotV2ray && chmod +x /bin/DotV2ray
bash /bin/DotV2ray ; exit 0
;;
# REboot
"G: Reboot the Linux")
reboot
;;


# Quit
"Quit")
	break
;;

# CLEAR SCREEN
"CLEAR")
	clear
;;


# WRONG INPUT
*) echo "invalid option $REPLY"
;;
esac

# DONE
done
