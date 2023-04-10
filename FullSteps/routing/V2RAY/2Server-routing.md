Server 1 - EURO

Server 2 - IRAN


Client (IRAN) 
              -> XRAY -> Server2
                                -> XRAY -> Server1
                                
***

روی دو تا سرور پنل v2ray نصب میکنیم

از پنل v2ray سرور اروپا، یه کانکشن میسازیم برای سرور ایران

کانکشن رو وارد v2rayN میکنیم، ازش خروجی میگیرم برای کلاینت


![image](https://user-images.githubusercontent.com/120102306/230876933-346268ef-eaad-42b8-af4d-85d7521e8d81.png)



فایل خروجی رو با notepad باز میکنیم

قسمت outbounds معمولا 3 تا تگ داره


اولینش برا اتصال پروکسی هست

تگ دوم direct هست

و تگ سوم هم که برا block هست.

***
توی قسمت outbounds از اولین پرانتز

که میشه تگ proxy
```
{
      "tag": "proxy",
```

تا آخرین پرانتر قبل از کاما برای شروع tag بعدی رو کپی میزنیم. (تگ بعدی معمولا direct هست)
```
    },
    {
      "tag": "direct",
```

برا مثال:

این کلا بخش outbonds برای کانفیگ هست

```
],
  "outbounds": [
    {
      "tag": "proxy",
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "extremeDOT.dot",
            "port": 59567,
            "users": [
              {
                "id": "419417e7-b0f6-42a4-f75f-8703e2f39560",
                "alterId": 0,
                "email": "t@t.tt",
                "security": "auto"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": false,
          "serverName": "extremeDOT.dot",
          "alpn": [
            "h2",
            "http/1.1"
          ],
          "fingerprint": "firefox",
          "show": false
        },
        "wsSettings": {
          "path": "/iksdhjd",
          "headers": {}
        }
      },
      "mux": {
        "enabled": false,
        "concurrency": -1
      }
    },
    {
      "tag": "direct",
      "protocol": "freedom",
      "settings": {}
    },
    {
      "tag": "block",
      "protocol": "blackhole",
      "settings": {
        "response": {
          "type": "http"
        }
      }
    }
  ],
  ```
  
  
  چیزی که ما لازم داریم، اینه
  
  ```
  {
      "tag": "proxy",
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "extremeDOT.dot",
            "port": 59567,
            "users": [
              {
                "id": "419417e7-b0f6-42a4-f75f-8703e2f39560",
                "alterId": 0,
                "email": "t@t.tt",
                "security": "auto"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "allowInsecure": false,
          "serverName": "extremeDOT.dot",
          "alpn": [
            "h2",
            "http/1.1"
          ],
          "fingerprint": "firefox",
          "show": false
        },
        "wsSettings": {
          "path": "/iksdhjd",
          "headers": {}
        }
      },
      "mux": {
        "enabled": false,
        "concurrency": -1
      }
    }
    ```
    ***
    
    حالا باید این تگ رو به سرور ایران اضافه کنیم، تا سرور ایران به سرور اروپا از طریق این کانکشن وصل بشه
    
    فایل کانفیگ سرور ایران رو از توی تنظیمات پنل v2ray باز میکنیم
    
   تگ پروکسی رو که از کانفیگ کلاینت سرور اروپا بدست اوردیم رو توی قسمت outbounds سرور ایران وارد میکنیم.
   
   
   بعد از اون سرور ایران رو ریستارت میکنیم.
   
   
   با راه اندازی مجدد، سرور ایران به سرور اروپا وصل میشه و در صورتی که ما به سرور ایران وصل بشیم، اینترنت ما به سرور اروپا منتقل داده میشه.
   
   
   
