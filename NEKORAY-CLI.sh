#!/bin/bash
clear
echo "EXTREME DOT - NEKORAY CLI V1.0"
echo "Enter [NEKORAY-CLI help] to see help and usage"
echo
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi
download() {
# DOWNLOADING NEKORAY FROM GIT-HUB
mkdir -p /ExtremeDOT/nekoray
cd /ExtremeDOT
wget https://github.com/MatsuriDayo/nekoray/releases/download/2.11/nekoray-2.11-2023-01-13-linux64.zip
unzip nekoray-2.11-2023-01-13-linux64.zip
rm /ExtremeDOT/*.zip
cd /ExtremeDOT/nekoray

# /ExtremeDOT/nekoray/nekobox_core version
# cp /usr/local/etc/v2ray/config.json /ExtremeDOT/nekoray/config.json
}

singbox_json() {
cat <<EOF > /ExtremeDOT/nekoray/sing-box-vpn.json
{
    "dns": {
        "servers": [
            {
                "tag": "dns-direct",
                "address": "underlying://0.0.0.0",
                "detour": "direct"
            }
        ]
    },
    "inbounds": [
        {
            "type": "tun",
            "interface_name": "nekoray-tun",
            "inet4_address": "172.19.0.1/28",
            "inet6_address": "fdfe:dcba:9876::1/126",
            "mtu": 9000,
            "auto_route": true,
            "strict_route": false,
            "stack": "gvisor",
            "endpoint_independent_nat": true,
            "sniff": false
        }
    ],
    "outbounds": [
        {
            "type": "socks",
            "tag": "nekoray-socks",
            "udp_fragment": true,
            
            "server": "127.0.0.1",
            "server_port": 2080
        },
        {
            "type": "block",
            "tag": "block"
        },
        {
            "type": "direct",
            "tag": "direct"
        },
        {
            "type": "dns",
            "tag": "dns-out"
        }
    ],
    "route": {
        "auto_detect_interface": true,
        "rules": [
            {
                "inbound": "dns-in",
                "outbound": "dns-out"
            },
            {
                "network": "udp",
                "port": [
                    135,
                    137,
                    138,
                    139,
                    5353
                ],
                "outbound": "block"
            },
            {
                "ip_cidr": [
                    "224.0.0.0/3",
                    "ff00::/8"
                ],
                "outbound": "block"
            },
            {
                "source_ip_cidr": [
                    "224.0.0.0/3",
                    "ff00::/8"
                ],
                "outbound": "block"
            },
            {
                "port": 53,
                "process_name": [
                    "nekoray_core",
                    "nekoray_core.exe"
                ],
                "outbound": "dns-out"
            },
            {
                "process_name": [
                    "nekoray_core",
                    "nekoray_core.exe",
                    "nekobox_core",
                    "nekobox_core.exe"
                ],
                "outbound": "direct"
            }
            
            
        ]
    }
}

EOF
}


installing_core() {
download
singbox_json
touch /ExtremeDOT/nekoray/config.json
touch /ExtremeDOT/nekoray/run1.sh
touch /ExtremeDOT/nekoray/run2.sh

echo "#!/bin/bash" > /ExtremeDOT/nekoray/run1.sh
echo "\"/ExtremeDOT/nekoray/nekoray_core\" run -config \"/ExtremeDOT/nekoray/config.json\" " >> /ExtremeDOT/nekoray/run1.sh

echo "#!/bin/bash" > /ExtremeDOT/nekoray/run2.sh
echo "\"/ExtremeDOT/nekoray/nekobox_core\" run -c \"/ExtremeDOT/nekoray/sing-box-vpn.json\" --protect-fwmark 514 " /ExtremeDOT/nekoray/run2.sh
}


pre_start_linux() {
  # set bypass: fwmark
  ip rule add pref 8999 fwmark 514 table main || return
  ip -6 rule add pref 8999 fwmark 514 table main || return

  # for Tun2Socket
  iptables -I INPUT -s 172.19.0.2 -d 172.19.0.1 -p tcp -j ACCEPT
  ip6tables -I INPUT -s fdfe:dcba:9876::2 -d fdfe:dcba:9876::1 -p tcp -j ACCEPT
}

start1() {
/ExtremeDOT/nekoray/run1.sh </dev/null &>/dev/null &
}

start2() {
/ExtremeDOT/nekoray/run2.sh </dev/null &>/dev/null &
}

if [ "$1" = "start" ]; then
    echo
    echo "Running Nekoray Client"
    pre_start_linux
    sleep 2
    start1
    sleep 3
    start2
  
  else if [ "$1" = "edit" ]; then
    echo
    echo "Editing Config.json files"
    nano /ExtremeDOT/nekoray/config.json

    else if [ "$1" = "install" ]; then
      echo
      echo "Installing Core.. Nekoray"
      installing_core

      else if [ "$1" = "stop" ]; then
        echo
        echo "Stopping Core.. Nekoray"
        iptables -D INPUT -s 172.19.0.2 -d 172.19.0.1 -p tcp -j ACCEPT
        ip6tables -D INPUT -s fdfe:dcba:9876::2 -d fdfe:dcba:9876::1 -p tcp -j ACCEPT
        ip rule del fwmark 514
        ip -6 rule del fwmark 514
        killall -9 nekobox_core
        killall -9 nekoray_core
        
        else if [ "$1" = "test" ]; then
          echo "TESTING IP Address"
          echo
          echo "------------------"
          echo "nekoray-tun 127.0.0.1:2080"
          echo
          echo "Testing Localhost:2080 port"
          curl --socks5 socks5://localhost:2080 https://myip.wtf/json -m 20
          echo
          echo "------------------"
          echo "Testing nekoray-tun interface"
          curl --interface nekoray-tun myip.wtf/json -m 20
        else if [ "$1" = "help" ]; then
          echo "Extreme Dot - NEKORAY CLI V1.0"
          echo
          echo "NEKORAY-CLI install"
          echo "NEKORAY-CLI start"
          echo "NEKORAY-CLI stop"
          echo "NEKORAY-CLI test"
          echo "NEKORAY-CLI edit"
          echo "NEKORAY-CLI update"
          echo "NEKORAY-CLI help"
          echo
          echo
            else if [ "$1" = "update" ]; then
            echo
            echo "Updating the script.."
            cd /tmp && curl -O https://raw.githubusercontent.com/ExtremeDot/vpn_setups/master/NEKORAY-CLI.sh
            sleep 2
            mv /tmp/NEKORAY-CLI.sh /bin/NEKORAY-CLI && chmod +x /bin/NEKORAY-CLI ; bin/NEKORAY-CLI ; exit
              else
              echo
              echo "Enter [NEKORAY-CLI help] to see help and usage"
              echo
              echo
fi; fi; fi; fi; fi; fi; fi

