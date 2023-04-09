# Method C - using Warp go


 
  - منبع این اسکریپت : [【WGCF】Connect to CF WARP to add IPv4/IPv6 network to the server](https://github.com/fscarmen/warp)


 - نصب اسکریپت
 - 

```
wget -N https://raw.githubusercontent.com/fscarmen/warp/main/warp-go.sh && bash warp-go.sh
```

  - انتخاب زبان


  - 1.English (default) 
  
  
  ![image](https://user-images.githubusercontent.com/120102306/230757233-d2b32140-0dfc-40d8-bd80-f8be0df0c82a.png)


***

- گزینه 6 رو میزنیم که آی پی نسخه 4 و 6 رو داشته باشیم
- 

  - 6. Add WARP dual-stacks global network interface for IPv4 only, IPv6 priority (bash warp-go.sh d)
    -  3. Use free account (default)

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

