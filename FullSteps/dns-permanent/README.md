### نصب منوی eMenu

```
curl -O https://raw.githubusercontent.com/ExtremeDot/GoldenOne_MENU/main/extraMenu.sh && chmod +x extraMenu.sh

mv extraMenu.sh /bin/eMenu && chmod +x /bin/eMenu
```

 - اجرای eMenu
 
 ```
 eMenu
 
 ```
 
 
 - صبر میکنیم تا نصب پیش نیاز ها تموم بشه
***

![image](https://user-images.githubusercontent.com/120102306/230776126-734d7b7e-a08b-461f-aafc-d4352508714b.png)


***

- گزینه 10 رو انتخاب میکنیم

 ```
 10) Set DNS Setting Permanently
 ```
 
 - سرویس DNS مد نظرمون رو انتخاب میکنیم

پیشفرض رو گذاشتم روی ادگارد که تبلیغات رو بلاک میکنه

ولی من روی کلاد فلر ست میکنم الان

```
DNS [1-12]: 1
```

***
 
 حالا اگه قایل زیر رو چک کنیم ، تنظیمات DNS رو بطور ثابت خواهیم داشت و مدام به حالت پیش فرض تغییر نمیکنه
 
 ```
 nano /etc/resolvconf/resolv.conf.d/head 
 ```
 
