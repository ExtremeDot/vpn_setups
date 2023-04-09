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

- ### راه اندازی سرویس وارپ کلودفلر جهت دورزدن محدودیت سایت ها

برای راه اندازی سرویس وارپ به بخش زیر مراجعه کنید و یکی از روش های نصب رو انتخاب کنید.


 - [روش اول](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/WARP-Setup/Method-A.md)
 - [روش دوم](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/WARP-Setup/Method-B.md)


***


- ### مسیر دهی کاربرها به سرور کلودفلر ، وقتی که سایت های مشخص شده را باز میکنند!


- [روش اول، استفاده از پراکسی وارپ سرویس](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/routing/V2RAY/warp-proxy.md)
- [روش دوم ، با استفاده از کلاینت وایرگارد -- درحال تست](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/routing/V2RAY/Wireguard.md)
