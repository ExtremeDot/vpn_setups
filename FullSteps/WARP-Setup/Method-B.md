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
  
    - 13.Install wireproxy. Wireguard client that exposes itself as a socks5 proxy or tunnels (bash menu.sh w)
      - Please customize the Client port (1000-65535. Default to 40000 if it is blank): **49999**
      - 1.Use free account (default)
      

![image](https://user-images.githubusercontent.com/120102306/230756511-9c976eed-0670-4b2c-885c-38281aea604f.png)


      
    
    
    
    
