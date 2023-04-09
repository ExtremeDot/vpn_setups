# در این روش تمامی اینرنت و ترافیک از سرویس warp عبور داده میشود

قبل از همه چیز، تنظیمات DNS رو دایمی میکنیم تا ایرادات مربوط به دانلود فایل ها رو نداشته باشیم.

### نصب DNS دایمی

برای اینکه مدام تنظیمات DNS پیشفرض لینوکس تغییر نکنه، از آموزش زیر استفاده میکنیم

آموزش تنظیم کردن[ DNS لینوکس به تنظیمات داعمی](https://github.com/ExtremeDot/vpn_setups/tree/main/FullSteps/dns-permanent)
***

```
wget -N https://raw.githubusercontent.com/fscarmen/warp/main/menu.sh && bash menu.sh

```

***


Select - 1.English (default)

![image](https://user-images.githubusercontent.com/120102306/230782527-5d61d74d-a58a-45af-9f61-2985ae01afb8.png)

***

- 3.Add WARP dualstack interface to IPv4 only VPS (bash menu.sh d)

* 1.Use free account (default)
   *  Please choose the priority: 
    *  2.IPv6
 
#### اگه نیاز به توضیحات بیشتر دارید، [قسمت گزینه های پیش رو ، در آموزش روش سوم](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/WARP-Setup/Method-C.md#%DA%AF%D8%B2%DB%8C%D9%86%D9%87-%D9%87%D8%A7%DB%8C-%D9%BE%DB%8C%D8%B4-%D8%B1%D9%88) رو مطالعه کنید 
***

 ### قدم بعدی تست سرویس و نحوه استفاده از اون هست.
 
 با دستور ifconfig ، تمام اینترفیس های فعال شبکه رو میبینیم
 
 ```
 ifconfig
 ```
 
 اگه سرویس بدرستی اجرا بشه باید wgcf اجرا و فعال باشه
 
 ![image](https://user-images.githubusercontent.com/120102306/230782953-45106541-72ef-4b52-834f-434fe5b6b1a5.png)


چک کردن ipv4 روی اینترفیس wgcf

```
curl -4 myip.wtf/json --interface wgcf
```

![image](https://user-images.githubusercontent.com/120102306/230783031-a82d6d15-592d-429b-8f73-46890872e1a7.png)


چک کردن ipv6 روی اینترفیس wgcf

```
curl -6 myip.wtf/json --interface wgcf
```

![image](https://user-images.githubusercontent.com/120102306/230783075-14dfb1e0-7c39-4884-aca1-b4bc01216636.png)

   
  
  میبینیم که جفت پروتوکل های نسخه 4 و 6 روی ISP کلادفلر هست
  
  #### اینترنت پیش فرض روی سرور رو چک میکنیم ببینیم روی کلادفلر ست شده یا اینکه تغییر نکرده ؟
  
  ```
  curl -4 myip.wtf/json
  ```
  
  میبینیم که با این تنظیمات، اینترنت پیش فرض روی سرویس warp مسیردهی شده و اگه با VPN هم به سرور وصل بشیم، اینترنت دریافتی ما از سرویس warp کلادفلر هست...
  
  ***
  
  - ###  حالا اگه بخوایم اینترنت پیش فرض سرور تغییر نکنه و برای فقط سایت های خاص ( مثل chatGPT, NetFlix , Disney ) از سرویس warp استفاده کنه، باید چیکار کنیم؟
  
  
  باید از wireProxy یا روش A استفاده کنیم.
  


***


  
  ***
  
  ### رفع ایراد


  اگه پیغام خطا گرفتیم، احتمالا سرویس فعال از کلاینت وارپ روی لینوکس هست، باید اول اونو غیرفعال کنیم
  
  ```
  eMenu
  
  11)CloudFlare WARP+
  6)Disconnect
  
```
 ***
 
 
  
  - 10. Sync the latest version (warp v) 
  
  ```
  bash /etc/wireguard/menu.sh
  
  ```
  ***


 Run again with warp [option] [lisence], such as
 
 ```
 warp h (help)
 warp n (Get the WARP IP)
 warp o (Turn off WARP temporarily)
 warp u (Turn off and uninstall WARP interface and Socks5 Linux Client)
 warp b (Upgrade kernel, turn on BBR, change Linux system)
 warp a (Change account to Free, WARP+ or Teams)
 warp p (Getting WARP+ quota by scripts)
 warp v (Sync the latest version)
 warp r (Connect/Disconnect WARP Linux Client)
 warp 4/6 (Add WARP IPv4/IPv6 interface)
 warp d (Add WARP dualstack interface IPv4 + IPv6)
 warp c (Install WARP Linux Client and set to proxy mode)
 warp l (Install WARP Linux Client and set to WARP mode)
 warp i (Change the WARP IP to support Netflix)
 warp e (Install Iptables + dnsmasq + ipset solution)
 warp w (Install WireProxy solution)
 warp y (Connect/Disconnect WireProxy socks5)
 warp s 4/6/d (Set stack proiority: IPv4 / IPv6 / VPS default)
 
 ```
 
![image](https://user-images.githubusercontent.com/120102306/230756511-9c976eed-0670-4b2c-885c-38281aea604f.png)


      
    
    
    
    
