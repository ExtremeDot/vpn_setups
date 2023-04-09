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


### گزینه های پیش رو



```

- 6. Add WARP dual-stacks global network interface for IPv4 only, IPv6 priority (bash warp-go.sh d)
  
 -  3. Use free account (default)
```

با انتخاب گزینه 6، اینترنت پیش فرض VPS به سرویس کلادفلر ادرس دهی میشه و توی همه حالات شما وقتی به سرور وصل میشی، اینترنتی که میگیرید اینترنت کلادفلر هست. 
معمولا هیچ محدودیتی نداره و هیج وقت هم آی پی واقعی شما توی سایت ها نشون داده نمیشه.
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


 - اگه گزینه 6 رو انتخاب کرده باشیم، با هر سرویس VPN که به سرورمون وصل بشیم، آی پی کلادفلر ست میشه. سرویس کلادفلر همیشه وصل هست برای هر آدرس و سایتی
 در کل نیازی به آدرس دهی (روتینگ) نداریم.
 
 
