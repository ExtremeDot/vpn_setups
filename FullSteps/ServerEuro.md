  *  ### Update and Upgrade the machine

``` Update and Upgrade the machine
apt-get update && apt-get upgrade -y
```
***
  

  - ### Check the real net speed of server
``` speed test check
# Install
apt-get install speedtest-cli -y

# Run Test
speedtest-cli
```

  - minimium recommended speed more than 100 Mbits/s
  - recommended speed more than 500 Mbit/s
    
***

  - ### Install SoftEther VPN Server

``` Softether Setup
# echo "nameserver 8.8.8.8" > /etc/resolv.conf


curl -O https://raw.githubusercontent.com/ExtremeDot/GoldenOne_MENU/main/build_se_stable.sh  && chmod +x build_se_stable.sh
bash build_se_stable.sh

```
- Values
  - Clean SoftEther Setup? [y/n]: **y**
  - IP address:**x.x.x.x**
  - Please enter your username: **username**
  - Please Set VPN Password: **password**
  - Set IPSec Shared Keys: **12345678**
  - What DNS resolvers do you want to use with the VPN? **1) Cloudflare (Anycast: worldwide)**
  - *** dnsmasq.conf (Y/I/N/O/D/Z) [default=N] ? **y**
  - SoftEther Link: **default link**
  - Softether Installation Method? **2**
  - Please enter IP gateway for virtual tap, example[10.10.9]: **10.10.9**
  - DHCP START IP: [Recommended = 10] **5**
  - DHCP END IP: [Recommended = 35 ~ 254 ] **250**
  - Install Extra Net IP forwarding configs? [y/n]: **n**
  - GoldenOne - First RUN Setup? [y/n]: **y**

![image](https://user-images.githubusercontent.com/120102306/230753997-2050bb5f-797c-4ee9-b6e6-a97e63823765.png)
  
- Save the information, copy the **PASSWORD** text.
 - you can see information later by running **seshow** command.


![image](https://user-images.githubusercontent.com/120102306/230754099-a6fe0107-efd0-497d-9ea3-5dcf6fb75246.png)


Connect to your VPN server using [Softether VPN Server Manager](https://www.softether-download.com/en.aspx).

***

- ### Install V2RAY Panel

- #### Setup SSL using acme

 - goto your cloudflare account, update domain and ip address , **no proxies**
  - ping domain to be sure it will return your VPS ip.

```
ping yourdomain.com 
```

- #### using my script


```
curl -O https://raw.githubusercontent.com/ExtremeDot/golden_one/master/extremeDOT.sh && chmod +x extremeDOT.sh

mv extremeDOT.sh /bin/extremeDOT && chmod +x /bin/extremeDOT

extremeDOT
```

![image](https://user-images.githubusercontent.com/120102306/230754304-28b409e3-bbe2-4741-a189-eb43ff8fe355.png)

 - 7) Input Domain and Email Address
  - NEW SERVER: Please enter damain address: **yourdomain.com**
  - NEW SERVER: Please enter E-MAIL address: **myemail.gmail.com**

 - 4)  Install Certificate USING ACME
  - Domain name and Email Address are correct? [y/n]: **y**
   -  the keys will store here


```
/root/cert.crt
/root/private.key
```

 - #### Installing Panel

![image](https://user-images.githubusercontent.com/120102306/230754445-f1835693-4f75-4a5a-929f-cbcb93c67e8b.png)

 - im using [3X-UI panel](https://github.com/MHSanaei/3x-ui)
  - 19) Sanae 3X-UI Panel
  - Do you want to continue with the modification [y/n]? : **y**
  - Please set up your username: **admin**
  - Please set up your password: **password**
  - Please set up the panel port: **54321**


Check the panel with **VPSIP:PORT**

![image](https://user-images.githubusercontent.com/120102306/230754561-29888899-8cde-4244-ab5a-4472c07e1841.png)


***

- ### Install CloudFlare Warp to unblock restricted sites such as Netflix, Disney, ChatGPT , google Captcha and etc....

- #### Install CloudFlare Warp Service Client into VPS using my script

```
curl -O https://raw.githubusercontent.com/ExtremeDot/GoldenOne_MENU/main/extraMenu.sh && chmod +x extraMenu.sh

mv extraMenu.sh /bin/eMenu && chmod +x /bin/eMenu

eMenu
```

 - 11) CloudFlare WARP+
 
 ![image](https://user-images.githubusercontent.com/120102306/230754704-12018a6c-90be-447a-8dc5-402cab7eb835.png)

 - 2) Install Cloudflare Warp+
  -  Do you want to continue? [Y/n] **y**
  
  -  Cloudflare Deb package address:
   -  clear the default link , my VPS is Ubuntu 20.04
   -  goto [Cloudlfare download page](https://pkg.cloudflareclient.com/packages/cloudflare-warp) and copy the link of latest build for your linux and past it
   -  the value for me, ubuntu 20.04 is https://pkg.cloudflareclient.com/uploads/cloudflare_warp_2023_3_398_1_amd64_9880b6c7ae.deb

![image](https://user-images.githubusercontent.com/120102306/230755035-638abaef-69ed-4aee-bdd8-19bf4c7ede82.png)

  - Accept Terms of Service and Privacy Policy? [y/N] **y**

 - 16) PROXY
 - 17) Set Proxy port
  - Enter port for proxy set [1000-50000]:**49999**

 - 3) Register and Enable New Account
  - NOTE: after that you will see the detais of your cloudflare IP
 
 ![image](https://user-images.githubusercontent.com/120102306/230755224-2bef1a4f-14f3-45a4-be63-68330734f9e3.png)

- ENTER 0  Back to Main-Menu , enter **0**
- 6) Show Busy/Used Ports by System
 - NOTE: see the port of warp service

![image](https://user-images.githubusercontent.com/120102306/230755265-c871f5e6-2510-460e-9a86-9fb498655708.png)

 
 - 8) Check Public IP by Socks5 Port's Number
  - Enter The V2ray Running Local Port: **49999**

![image](https://user-images.githubusercontent.com/120102306/230755318-0d52b004-6db4-43b6-bfff-e15341189003.png)

***

- #### Import Cloudflare Proxy Server into V2RAY Config

 - goto V2ray Panel 
  - Panel Settings
   - Xray Configuration
   - Step 1: Configuration of Outbounds

edit it as below 
NOTE: Port is **49999**

```
[
  {
    "protocol": "freedom",
    "settings": {}
  },
  {
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  },
  {
    "tag": "WARP_OUT",
    "protocol": "socks",
    "settings": {
      "servers": [
        {
          "address": "127.0.0.1",
          "port": 49999
        }
      ]
    },
    "streamSettings": {
      "network": "tcp"
    }
  }
]
```

![image](https://user-images.githubusercontent.com/120102306/230755547-9c4d581b-4de4-499e-99e2-2d730796f50d.png)



   - Step 2: Configuration of Routing rules

edit as below

```
[
  {
    "inboundTag": [
      "api"
    ],
    "outboundTag": "api",
    "type": "field"
  },
  {
    "type": "field",
    "outboundTag": "WARP_OUT",
    "domain": [
      "geosite:netflix",
      "geosite:disney",
      "geosite:spotify",
      "geosite:youtube",
      "geosite:hulu",
      "geosite:hbo",
      "geosite:bbc",
      "geosite:fox",
      "geosite:google"
    ]
  },
  {
    "ip": [
      "geoip:private"
    ],
    "outboundTag": "blocked",
    "type": "field"
  },
  {
    "outboundTag": "blocked",
    "protocol": [
      "bittorrent"
    ],
    "type": "field"
  }
]

```

 - Save and Restart the panel

![image](https://user-images.githubusercontent.com/120102306/230755626-a773edf7-9953-4615-866c-8cea4cbd0da3.png)


  
