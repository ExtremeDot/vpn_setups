
- ### نصب پنل سرور V2ray


***

- #### گرفتن لایسنسس SSL برای سرور

 - وارد داشبورد کلادفلر میشیم، آی پی سرور رو به دامین اختصاص میدیم
  - از دامین یا ساب دامین پینگ میگیریم که مطمین بشیم آی پی سرور رو برمیگردونه

```
ping yourdomain.com 
```

- #### انجام مراحل با اسکریپت خودم


```
curl -O https://raw.githubusercontent.com/ExtremeDot/golden_one/master/extremeDOT.sh && chmod +x extremeDOT.sh

mv extremeDOT.sh /bin/extremeDOT && chmod +x /bin/extremeDOT

extremeDOT
```

![image](https://user-images.githubusercontent.com/120102306/230754304-28b409e3-bbe2-4741-a189-eb43ff8fe355.png)

گزینه 7  رو انتخاب میکنیم، ادرس دامین و ایمیل رو وارد میکنیم
 - 7)Input Domain and Email Address
  - NEW SERVER: Please enter damain address: **yourdomain.com**
  - NEW SERVER: Please enter E-MAIL address: **myemail.gmail.com**

گزینه 4 رو انتخاب میکنیم، در صورتی که اطلاعات درسته، y رو وارد کنید و بقیه داستان خودکار انحام میشه
 - 4)Install Certificate USING ACME
  - Domain name and Email Address are correct? [y/n]: **y**
   -  the keys will store here

در انتها کلیدهای امنیتی اینجا ذخیره میشه
```
/root/cert.crt
/root/private.key
```

***


 - #### نصب کردن پنل 



![image](https://user-images.githubusercontent.com/120102306/230754445-f1835693-4f75-4a5a-929f-cbcb93c67e8b.png)

 - im using [3X-UI panel](https://github.com/MHSanaei/3x-ui)
  - 19) Sanae 3X-UI Panel
  - Do you want to continue with the modification [y/n]? : **y**
  - Please set up your username: **admin**
  - Please set up your password: **password**
  - Please set up the panel port: **54321**

 - #### تنظیمات پیش فرض

```
Port: 2053
username and password will be generated randomly if you skip to modify your own security(x-ui "7")
database path: /etc/x-ui/x-ui.db
xray config path: /usr/local/x-ui/bin/config.json
````

Check the panel with **VPSIP:PORT**

![image](https://user-images.githubusercontent.com/120102306/230754561-29888899-8cde-4244-ab5a-4472c07e1841.png)


