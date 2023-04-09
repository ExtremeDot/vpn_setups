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
