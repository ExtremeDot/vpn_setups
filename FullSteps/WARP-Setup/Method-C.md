این روش رو پیشنهاد نمیکنم، از روش اول یا دوم استفاده کنید

# Method C - using Warp go


 
  - منبع این اسکریپت : [【WGCF】Connect to CF WARP to add IPv4/IPv6 network to the server](https://github.com/fscarmen/warp)


 - نصب اسکریپت


```
wget -N https://raw.githubusercontent.com/fscarmen/warp/main/warp-go.sh && bash warp-go.sh
```

  - انتخاب زبان


  - 1.English (default) 
  
  
  ![image](https://user-images.githubusercontent.com/120102306/230757233-d2b32140-0dfc-40d8-bd80-f8be0df0c82a.png)


***


* گزینه 6 رو میزنیم که آی پی نسخه 4 و 6 رو داشته باشیم




```

- 6. Add WARP dual-stacks global network interface for IPv4 only, IPv6 priority (bash warp-go.sh d)
  
 -  3. Use free account (default)
```

***

### تست کردن کانکش 


خب اینجا باید چک کنیم، سرویسی که راه اندازی کردیم اصلا کار میکنه یا نه؟

 - چک کردن اینترفیس

```
ifconfig
```

باید اینترفیس WARP رو داشته باشیم

![image](https://user-images.githubusercontent.com/120102306/230777981-de389030-3c10-4d1c-be58-9fbfbeb6559d.png)


- چک کردن ip اینترفیس WARP

```
curl -4 myip.wtf/json  --interface WARP
```

![image](https://user-images.githubusercontent.com/120102306/230778089-23f4e2c3-f81b-4abf-b44c-fd5b531e79b8.png)

بعد از اینکه از اتصال مطمین شدیم، میریم برا قسمت بعدی که آدرس دهی هست.

***





- در انتها ساخته که شد، باید خروجی کانفیگ رو برای وایرکارد و تنظیمات v2ray استخرا کنیم


![image](https://user-images.githubusercontent.com/120102306/230757342-e7e89605-be0a-4ba2-ab67-8e4dd80e4032.png)


***

برای استخراج کانفیگ ها
دستور زیر رو میزنیم
  
```
warp-go e
```

***

تنظیمات وایرگارد توی این آدرس ذخیره میشه


```
nano /opt/warp-go/wgcf.conf
```

***

تنظیمات برای v2ray هم اینجا ذخیره میشه

```
nano /opt/warp-go/singbox.json
```


***

