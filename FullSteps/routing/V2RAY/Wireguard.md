
# هنوز کامل نشده

[منبع فایل
](https://xtls.github.io/config/outbounds/wireguard.html#outboundconfigurationobject)
توی این آموزش میخوایم کلاینت وایرگارد، که بصورت سرویس وارپ توی این آموزش اجرا کردیم ، رو توی تنظیمات v2ray اضاف کنیم و از این سرویس برای آدرس دهی به سایت های مورد نظرمون استفاده کنیم


***

### پیش نیازها:

  - تنظیمات وایرگارد که از دستور زیر میگیریم

```
nano /opt/warp-go/wgcf.conf
```


***

فایل کانفیگ v2ray سرور رو باز میکنیم



توی قسمت  outbounds یه مقدار جدید تعریف میکنیم

اگه بخوایم outband رو ساده تعریف کنیم، میشه اینترنتی که قراره به کاربر تحویل داده بشه.


***

ببینید ساختار outbounds این شکلیه


```
"outbounds": [
{DEFINE1},
{DEFINE2},
{DEFINE3},
{DEFINE4}
]
```

***
تنظیمات outbands فایل پیش فرضش این شکلیه

```
"outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    }
]
  
  ```

حالا ما میخوایم کانکش وایرگارد رو بهش اضافه کنیم
