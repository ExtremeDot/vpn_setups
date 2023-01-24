#!/bin/bash
# CREDIT https://raw.githubusercontent.com/jinwyp/one_click_script/master/install_kernel.sh
# ROOT CONDITIONS
YELLOW='\033[0;33m'	# YELLOW
RED='\033[0;31m'        # Red
BLUE='\033[1;34m'       # LIGHTBLUE
GREEN='\033[0;32m'      # Green
NC='\033[0m'            # No Color
red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
bold(){
    echo -e "\033[1m\033[01m$1\033[0m"
}

Green_font_prefix="\033[32m" 
Red_font_prefix="\033[31m" 
Green_background_prefix="\033[42;37m" 
Red_background_prefix="\033[41;37m" 
Font_color_suffix="\033[0m"

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
yellow " Extreme DOT V2ray Panel Setup V1.12 " 
yellow "==========================================="
PS3=" $(echo -e $'\n'-----------------------------$'\n' "   Enter Option:" ) "
echo -e "${YELLOW}Current Installed Kernel= `cat /proc/version | sed 's/.(.*//'`"
echo -e "${GREEN}"

options=(
"A: Update the Linux Machine to Latest"
"B: Install XanMod Kernel , bbr included"
"C: Install ACME Certificate"
"D: Install English V2Ray Panel [proxykingdev] "
"E: Install and Enable Firewall and Set Ports.. "
"F: BackUP current Server X-UI files"
"G: Restore X-UI files from backup folder"
"H: Install WireGuard [Kernel > 5.6] + Cloudflare WARP + avoid Google reCAPTCHA "
"Reboot the Linux"
"Check for Updates"
"CLEAR"
"Quit"
)
echo -e "${GREEN}"
select opt in "${options[@]}"
do
case $opt in

"A: Update the Linux Machine to Latest")
echo "" ; echo "Updating System"
apt-get update
apt-get -y upgrade
echo "" ; echo "Please reboot the system."
echo -e "${GREEN}"
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
echo -e "${GREEN}"
;;
esac

echo "" && echo " Kernel has installed ..."
echo "" && echo " updating system ..."
apt install -y intel-microcode iucode-tool
sleep 1
apt update
apt -y upgrade
echo "" ; echo "Please reboot the system."
echo -e "${GREEN}"
;;

"C: Install ACME Certificate")
echo
EMAILADD=""
read -e -i "$EMAILADD" -p "Enter Email Address: " input
EMAILADD="${input:-$EMAILADD}"
echo
DOMAINNM=""
read -e -i "$DOMAINNM" -p "Enter Domain name: " input
DOMAINNM="${input:-$DOMAINNM}"
echo
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
clear
~/.acme.sh/acme.sh --installcert -d $DOMAINNM --key-file /root/private.key --fullchain-file /root/cert.crt
echo
green "Certfiles are copied to :"
echo
blue "/root/cert.crt"
blue "/root/private.key"
echo -e "${GREEN}"
;;

"D: Install English V2Ray Panel [proxykingdev] ")
clear
echo
yellow "Installing proxykingdev X-UI Panel"
echo "GITUHB: https://github.com/proxykingdev/x-ui "
echo
mkdir -p /tmp/v2Server
cd /tmp/v2Server
wget --no-check-certificate -O install https://raw.githubusercontent.com/proxykingdev/x-ui/master/install
sleep 1
chmod +x install

# Enable IPV6 ?
echo ""
green "Do you want to enable IPv6? Avoid Google reCAPTCHA human verification"
until [[ $IPV6ABLE =~ (y|n) ]]; do
read -rp "Enable IPV6 Support? ? [y/n]: " -e -i y IPV6ABLE
done
if [[ $IPV6ABLE == "y" ]]; then
echo "Enabling IPV6 Support"
if [[ $(sysctl -a | grep 'disable_ipv6.*=.*1') || $(cat /etc/sysctl.{conf,d/*} | grep 'disable_ipv6.*=.*1') ]]; then
        sed -i '/disable_ipv6/d' /etc/sysctl.{conf,d/*}
        echo 'net.ipv6.conf.all.disable_ipv6 = 0' >/etc/sysctl.d/ipv6.conf
        sysctl -w net.ipv6.conf.all.disable_ipv6=0
fi
sleep 1
fi
# Run V2RAY Script
/tmp/v2Server/./install
echo -e "${GREEN}"
;;

"E: Install and Enable Firewall and Set Ports.. ")
green " ========================================================"
green "  Installing Firewall "
green " ========================================================"
echo
clear
if [ $(dpkg-query -W -f='${Status}' ufw 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
green " Installing Firewall"
apt install -y ufw;
clear
green " Firewall is installed " ;
else
green " Firewall has installed allready.." ;
fi
yellow " Please enter the Port number for ADMIN v2ray Panel"
echo
V2Ray_PORT=12345
read -e -i "$V2Ray_PORT" -p "please Enter X-UI Panel Port: " input
V2Ray_PORT="${input:-$V2Ray_PORT}"
echo
yellow " Please enter the STARTING Port number for Users over v2ray Panel"
echo
V2Ray_STARTPORT=500
read -e -i "$V2Ray_STARTPORT" -p "Please Enter STARTING Port for users: " input
V2Ray_STARTPORT="${input:-$V2Ray_STARTPORT}"
echo 
yellow " Please enter the ENDING Port number for Users over v2ray Panel"
V2Ray_ENDPORT=600
read -e -i "$V2Ray_ENDPORT" -p "Please Enter ENDING Port for users: " input
V2Ray_ENDPORT="${input:-$V2Ray_ENDPORT}"
echo
green "Open ports for ssh, http and https access."
ufw allow http
ufw allow https
ufw allow ssh
echo
green "Firewall Opened Port for X-UI admin panel on $V2Ray_PORT port."
echo
ufw allow $V2Ray_PORT
sleep 1
green "Firewall Opened Ports from $V2Ray_STARTPORT to $V2Ray_ENDPORT for Users access."
ufw allow $V2Ray_STARTPORT:$V2Ray_ENDPORT/tcp
sleep 1
ufw allow $V2Ray_STARTPORT:$V2Ray_ENDPORT/udp
sleep
green "Enabling Firewall"
ufw enable
echo
green " you can disable or enable firewall using commands:"
blue " ufw enable"
red " ufw disable"
echo -e "${GREEN}"
;;


"F: BackUP current Server X-UI files")
mkdir -p /dot_migrate_xui/backup/
clear
echo
if test -f "/dot_migrate_xui/x-ui.db"; then
blue "Backup files are found!"
echo
green "Moving latest backup files into /dot_migrate_xui/backup folder"
dateformate=$(date '+%Y-%m-%d_%H:%M')
mv "/dot_migrate_xui/config.json" "/dot_migrate_xui/backup/$dateformate-config.json"
mv "/dot_migrate_xui/x-ui.db" "/dot_migrate_xui/backup/$dateformate-x-ui.db"
green " files are moved into /dot_migrate_xui/backup/"
echo "$dateformate-config.json AND $dateformate-x-ui.db"
echo
fi
sleep 1
cp /usr/local/x-ui/bin/config.json /dot_migrate_xui/config.json
cp /etc/x-ui/x-ui.db /dot_migrate_xui/x-ui.db
echo
yellow "Files are backed up in /dot_migrate_xui/ folder "
green " Now you can download files using " yellow "WinSCP program"
green " Connect to this server and download 2 files from /dot_migrate_xui folder "
echo
green "/dot_migrate_xui/x-ui.db"
green "/dot_migrate_xui/config.json"
green " finsih"
echo -e "${GREEN}"
;;


"G: Restore X-UI files from backup folder")
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
echo -e "${GREEN}"
;;

"H: Install WireGuard [Kernel > 5.6] + Cloudflare WARP + avoid Google reCAPTCHA ")
configWireGuardConfigFilePath="/etc/wireguard/wgcf.conf"
    
	if [[ -f "${configWireGuardConfigFilePath}" ]]; then
        green " ========================================================"
        green "  Wireguard has been installed allready. "
		green "  if you need to reinstall, "
		green "  you can choose to uninstall Wireguard and reinstall it!"
        green " ========================================================"
        exit
    fi


    green " =================================================="
    green " install WireGuard "
    echo
    red " Before installation, it is recommended to upgrade kernel to 5.6 or above."
    red " If it is a new and clean system that has not changed the kernel"
	red " you can continue to install WireGuard directly without exiting to install other kernels"
    red " If you have installed other kernels (such as the BBR Plus kernel)"
	red " it is recommended to install a kernel higher than 5.6 first"
	red " running Wireguard on kernel lower than 5.6 causes WireGuard cannot be started"
    red " If WireGuard fails to start, it is recommended to redo the new system"
	red " upgrade the system to the 5.10 kernel, and then install WireGuard."
	red " Or do not replace other kernels after redoing the new system, install WireGuard directly"
    green " =================================================="
    echo
	green "Do you want to continue? Please confirm that the linux kernel version has more than 5.6 "


    
	read -p "Your Linux Kernel is Higher than 5.6?, Yes? [Y/n]::" isContinueInput
	isContinueInput=${isContinueInput:-Y}

	if [[ ${isContinueInput} == [Yy] ]]; then
		echo
        	green " =================================================="
        	green " Start installing WireGuard "
        	green " =================================================="
	else 
        	green " It is recommended to use this script to install the kernel above linux kernel 5.6! "
	exit
	fi

    echo
    echo
    
apt --fix-broken install -y
apt-get update
apt install -y openresolv
apt install -y resolvconf
apt install -y net-tools iproute2 dnsutils
apt install -y wireguard-tools 
apt install -y wireguard
apt install -y wireguard-tools 
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service
green " ================================================== "
green "  Wireguard installed successfully!"
green " ================================================== "

function getGithubLatestReleaseVersion(){
    wget --no-check-certificate -qO- https://api.github.com/repos/$1/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -b 2-
}

versionWgcf="2.2.15"
downloadFilenameWgcf="wgcf_${versionWgcf}_linux_amd64"
configWgcfBinPath="/usr/local/bin"
configWgcfConfigFolderPath="${HOME}/wireguard"
configWgcfAccountFilePath="${configWgcfConfigFolderPath}/wgcf-account.toml"
configWgcfProfileFilePath="${configWgcfConfigFolderPath}/wgcf-profile.conf"
configWARPPortFilePath="${configWgcfConfigFolderPath}/warp-port"
configWireGuardConfigFileFolder="/etc/wireguard"
configWireGuardConfigFilePath="/etc/wireguard/wgcf.conf"
configWireGuardDNSBackupFilePath="/etc/resolv_warp_bak.conf"
configWarpPort="40000"
versionWgcf=$(getGithubLatestReleaseVersion "ViRb3/wgcf")
downloadFilenameWgcf="wgcf_${versionWgcf}_linux_amd64"
echo
green " =================================================="
green " Install Cloudflare WARP CLI tool Wgcf ${versionWgcf}"
green " =================================================="
echo
mkdir -p ${configWgcfConfigFolderPath}
mkdir -p ${configWgcfBinPath}
mkdir -p ${configWireGuardConfigFileFolder}
cd ${configWgcfConfigFolderPath}
wget -O ${configWgcfConfigFolderPath}/wgcf --no-check-certificate "https://github.com/ViRb3/wgcf/releases/download/v${versionWgcf}/${downloadFilenameWgcf}"
	if [[ -f ${configWgcfConfigFolderPath}/wgcf ]]; then
		green "Cloudflare WARP command line tool Wgcf ${versionWgcf} downloaded successfully!"
		echo
    else
		red "  Wgcf ${versionWgcf} download failed! "
		exit 255
    fi

chmod +x ${configWgcfConfigFolderPath}/wgcf
cp ${configWgcfConfigFolderPath}/wgcf ${configWgcfBinPath}
	if [[ -f ${configWgcfAccountFilePath} ]]; then
		echo
	else
		yes | ${configWgcfConfigFolderPath}/wgcf register 
	fi
echo
echo
green " =================================================="
yellow " If you have not purchased a WARP+ subscription, please press Enter to skip this step, Press enter to continue without WARP+"
echo
yellow " If you have purchased WARP+ subscription, you can fill in the license key to enable WARP+"
    green " How to check: Open the Cloudflare 1.1.1.1 app on your phone, click the top right menu click hamburger menu button on the top-right corner "
    green " Navigate to: Account > Key, select the key in the Account menu is the license key"
    echo

    read -p "Please Input license key! Press Enter to skip by default, please enter:" isWARPLicenseKeyInput
    isWARPLicenseKeyInput=${isWARPLicenseKeyInput:-n}

    if [[ ${isWARPLicenseKeyInput} == [Nn] ]]; then
        echo
    else 
        sed -i "s/license_key =.*/license_key = \"${isWARPLicenseKeyInput}\"/g" ${configWgcfAccountFilePath}
        WGCF_LICENSE_KEY="${isWARPLicenseKeyInput}" wgcf update
    fi

    if [[ -f ${configWgcfProfileFilePath} ]]; then
        echo
    else
        yes | ${configWgcfConfigFolderPath}/wgcf generate 
    fi
    

    cp ${configWgcfProfileFilePath} ${configWireGuardConfigFilePath}

    enableWireguardIPV6OrIPV4

    echo 
    green " Start Wireguard temporarily, to test it starts normally, run the command: wg-quick up wgcf"
    ${sudoCmd} wg-quick up wgcf

    echo 
    green " Start to verify whether Wireguard is started normally, and detect whether to use Cloudflare's ipv6 access !"
    echo
    echo "curl -6 ip.p3terx.com"
    curl -6 ip.p3terx.com 
    echo
    isWireguardIpv6Working=$(curl -6 ip.p3terx.com | grep CLOUDFLARENET )
    echo

    if [[ -n "$isWireguardIpv6Working" ]]; then	
        green " Wireguard started fine and has successfully reached the network via IPv6 provided by Cloudflare WARP! "
    else 
        green " ================================================== "
        red " Wireguard detects IPV6 access failure using CLOUDFLARENET through curl -6 ip.p3terx.com"
        red " Please check if the linux kernel is installed correctly"
        red " The installation will continue to run, and it may be successful, but IPV6 is not used"
        red " To check whether WireGuard is started successfully, you can run the command to check the running status: systemctl status wg-quick@wgcf"
        red " If WireGuard fails to start, run the log command to find out why: journalctl -n 50 -u wg-quick@wgcf"
        red " If WireGuard fails to start, it is recommended to redo the new system, do not replace other kernels, and install WireGuard directly"
        green " ================================================== "
    fi

    echo
    green " To disable Wireguard, which was started temporarily for testing, run the command: wg-quick down wgcf "
    ${sudoCmd} wg-quick down wgcf
    echo

    ${sudoCmd} systemctl daemon-reload
    

    ${sudoCmd} systemctl enable wg-quick@wgcf


    ${sudoCmd} systemctl start wg-quick@wgcf

    # (crontab -l ; echo "12 6 * * 1 systemctl restart wg-quick@wgcf ") | sort - | uniq - | crontab -

    checkWireguardBootStatus

    echo
    green " ================================================== "
    green "  Wireguard and the Cloudflare WARP command line tool Wgcf ${versionWgcf} installed successfully!"
    green "  Account configuration file path for Cloudflare WARP application: ${configWgcfAccountFilePath}"
    green "  Path to Wireguard configuration file generated by Cloudflare WARP: ${configWireGuardConfigFilePath} "
    echo
    green "  Wireguard stop command: systemctl stop wg-quick@wgcf Start command: systemctl start wg-quick@wgcf Restart command: systemctl restart wg-quick@wgcf"
    green "  Wireguard view log: journalctl -n 50 -u wg-quick@wgcf"
    green "  Check the running status of Wireguard: systemctl status wg-quick@wgcf"
    echo
    green "  Use this script to install v2ray or xray, you can choose whether to unlock Netflix restrictions and avoid popping up Google reCAPTCHA man-machine verification!"
    echo
    green "  For v2ray or xray installed by other scripts, please replace the v2ray or xray configuration file by yourself!"
    green "  You can refer to the tutorial on how to use IPv6 to access Netflix https://ybfl.xyz/111.html or https://toutyrater.github.io/app/netflix.html"
    green " ================================================== "

    # https://p3terx.com/archives/use-cloudflare-warp-to-add-extra-ipv4-or-ipv6-network-support-to-vps-servers-for-free.html
    
    
    ${sudoCmd} systemctl stop wg-quick@wgcf

    cp /etc/resolv.conf ${configWireGuardDNSBackupFilePath}

    sed -i '/nameserver 2a00\:1098\:2b\:\:1/d' /etc/resolv.conf

    sed -i '/nameserver 8\.8/d' /etc/resolv.conf
    sed -i '/nameserver 9\.9/d' /etc/resolv.conf
    sed -i '/nameserver 1\.1\.1\.1/d' /etc/resolv.conf

    echo
    green " ================================================== "
    yellow " Please choose whether to add IPv6 networking or IPv4 networking support for the server: "
    echo
    green " 1 Added IPv6 network (used to unblock Netflix restrictions and avoid Google reCAPTCHA pop-ups)"
    green " 2 Add IPv4 network (for adding IPv4 network support to IPv6-only VPS hosts)"
    echo
    read -p "Please choose to add IPv6 or IPv4 network support? Press Enter to select 1 by default, please enter[1/2]:" isAddNetworkIPv6Input
	isAddNetworkIPv6Input=${isAddNetworkIPv6Input:-1}

	if [[ ${isAddNetworkIPv6Input} == [2] ]]; then

        # 为 IPv6 Only 服务器添加 IPv4 网络支持

        sed -i 's/^AllowedIPs = \:\:\/0/# AllowedIPs = \:\:\/0/g' ${configWireGuardConfigFilePath}
        sed -i 's/# AllowedIPs = 0\.0\.0\.0/AllowedIPs = 0\.0\.0\.0/g' ${configWireGuardConfigFilePath}

        sed -i 's/engage\.cloudflareclient\.com/\[2606\:4700\:d0\:\:a29f\:c001\]/g' ${configWireGuardConfigFilePath}
        sed -i 's/162\.159\.192\.1/\[2606\:4700\:d0\:\:a29f\:c001\]/g' ${configWireGuardConfigFilePath}

        sed -i 's/^DNS = 1\.1\.1\.1/DNS = 2620:fe\:\:10,2001\:4860\:4860\:\:8888,2606\:4700\:4700\:\:1111/g'  ${configWireGuardConfigFilePath}
        sed -i 's/^DNS = 8\.8\.8\.8,8\.8\.4\.4,1\.1\.1\.1,9\.9\.9\.10/DNS = 2620:fe\:\:10,2001\:4860\:4860\:\:8888,2606\:4700\:4700\:\:1111/g'  ${configWireGuardConfigFilePath}
        
        echo "nameserver 2a00:1098:2b::1" >> /etc/resolv.conf
        
        echo
        green " Wireguard has successfully switched to IPv4 network support for VPS servers"

    else

        # 为 IPv4 Only 服务器添加 IPv6 网络支持
        sed -i 's/^AllowedIPs = 0\.0\.0\.0/# AllowedIPs = 0\.0\.0\.0/g' ${configWireGuardConfigFilePath}
        sed -i 's/# AllowedIPs = \:\:\/0/AllowedIPs = \:\:\/0/g' ${configWireGuardConfigFilePath}

        sed -i 's/engage\.cloudflareclient\.com/162\.159\.192\.1/g' ${configWireGuardConfigFilePath}
        sed -i 's/\[2606\:4700\:d0\:\:a29f\:c001\]/162\.159\.192\.1/g' ${configWireGuardConfigFilePath}
        
        sed -i 's/^DNS = 1\.1\.1\.1/DNS = 8\.8\.8\.8,8\.8\.4\.4,1\.1\.1\.1,9\.9\.9\.10/g' ${configWireGuardConfigFilePath}
        sed -i 's/^DNS = 2620:fe\:\:10,2001\:4860\:4860\:\:8888,2606\:4700\:4700\:\:1111/DNS = 8\.8\.8\.8,1\.1\.1\.1,9\.9\.9\.10/g' ${configWireGuardConfigFilePath}

        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 8.8.4.4" >> /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
        #echo "nameserver 9.9.9.9" >> /etc/resolv.conf
        echo "nameserver 9.9.9.10" >> /etc/resolv.conf

        echo
        green " Wireguard has successfully switched to IPv6 network support for VPS servers"
    fi
    
    green " ================================================== "
    echo
    green " Wireguard configuration information is as follows Configuration file path: ${configWireGuardConfigFilePath} "
    cat ${configWireGuardConfigFilePath}
    green " ================================================== "
    echo

    # -n 不为空
    if [[ -n $1 ]]; then
        ${sudoCmd} systemctl start wg-quick@wgcf
    else
        preferIPV4
    fi
echo -e "${GREEN}"
;;


"Check for Updates")
cd /tmp && curl -O https://raw.githubusercontent.com/ExtremeDot/vpn_setups/master/dot-v2ray.sh
mv /tmp/dot-v2ray.sh /bin/DotV2ray && chmod +x /bin/DotV2ray
bash /bin/DotV2ray ; exit 0
echo -e "${GREEN}"
;;
# REboot
"Reboot the Linux")
reboot
;;


# Quit
"Quit")
	echo -e "${NC}"
	break
;;

# CLEAR SCREEN
"CLEAR")
	clear
	echo -e "${GREEN}"
;;


# WRONG INPUT
*) echo "invalid option $REPLY"
echo -e "${GREEN}"
;;
esac

# DONE
done
