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


توی مراجل ساخت، اگه اکانت warp ندارید، از گزینه -  3. Use free account (default) استفاده کنید.





```
Add WARP IPv4 global network interface for IPv4 only[,] IPv4 priority
```

گزینه ها به دو قسمت تقسیم شدن، که با کارکتر کاما , از هم جدا شدن

***
قسمت اول چندین توضیح داره که میگم بهتون


```
[Add WARP IPv4] global network interface for IPv4 only, IPv4 priority
```

***
عبارت با 
```
Add WARP IPv4
```

یا 
```
Add WARP IPv6
```
یا 
```
dual-stacks 
```

شروع میشه، منظورش اینه که اینترنت پیش فرضی که قراره بعد از اجرای warp روی سیستم فعال یشه کدوم باشه

dual-stack  میشه فعال شدن جفت پروتوکل های نسخه 4 و 6

***

#### عبارت بعدی شامل global network interface  و  non-global network interface هست

```
Add WARP IPv4 global network interface for IPv4 only[,] IPv4 priority
```

اینجا داره توضیح میده که بعد از اینکه نوع پروتوکل IP رو مشخص کردیم، قرار اینترنت پیش فرض سرور از اینترنت سرویس warp استفاده کنه یا اینترنت خود سرور

اگه global network انتخاب بشه، در صورتی که از طریق vpn به سرور متصل بشیم، اینترنتی که میگیرم از سرویس warp cloudflare هست و آی پی سرور توی هیچ سایتی مشخص نمیشه.

اگه non-global network رو انتخاب کنیم، اینترنت محلی یا پیش فرض سرور تغییر نمیکنه و اگه با vpn به سرور وصل بشیم، همون اینترنت سرور رو داریم. که در این روش برای استفاده از سرویس کلادفلر باید routing یا مسیردهی رو بصورت دستی انجام بدیم.


#### قسمت بعدی با IPv4 only یا IPv6 only یا dual-stack نشون داده میشه
```
Add WARP IPv4 global network interface for [IPv4 only], IPv4 priority
```

اولویت آدرس دهی اینترنت به نوع پروتوکل ارتباطی ، مثلا تمامی اینترنت رو از پروتوکل نسخه 6 رد کنه، یا از نسخه 4 رد کنه یا اینکه بصورت خودکار از 6 یا 4 استفاده کنه


بستگی به سرورتون داره که IPv6 داشته باشه یا نه، اگه نداشته باشه که میشه IPv4


***

قسمت دوم که بعد از کاما هست، مشخص میکنه که بعد از راه اندازی warp ، اولویت انتخاب پروتوکل ارتباطی روی سرویس warp چی باشه؟

حالا میتونید انتخاب کنید اولویت با ipv4 باشه یا ipv6


***

### چند تا مثال

#### گزینه 1
```
1. Add WARP IPv4 global network interface for IPv4 only, IPv4 priority (bash warp-go.sh 4)


```

توی این حالت ، فقط ipv4 روی سرویس warp فعال میشه و وقتی به VPN سرورمون وصل بشم، آی پی سرویس کلاد فلر رو برمیگردونه 

 توی همه حالات شما وقتی به سرور وصل میشی، اینترنتی که میگیرید اینترنت کلادفلر هست. 
معمولا هیچ محدودیتی نداره و هیج وقت هم آی پی واقعی شما توی سایت ها نشون داده نمیشه

***

#### گزینه 6


```
- 6.Add WARP dual-stacks global network interface for IPv4 only, IPv6 priority (bash warp-go.sh d)
```



با انتخاب گزینه 6، سرویس کلادفلر هم ipV4 داره و هم ipV6 
اینترنت پیش فرض VPS به سرویس کلادفلر ادرس دهی میشه.

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
 
 
