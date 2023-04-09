در این آموزش میخوایم، برای سایت هایی که مشخص میکنیم، اینترنت از پروکسی 49999 ، اینترنت warp، استفاده کنه



***
## - تغییرات در outbounds


- پورت 49999 رو توی تنظیمات config.json اضافه میکینیم.

از پنل v2ray وارد panel settings و سپس وارد xray configuration میشیم.


NOTE: Port is **49999**

```
[
  {
    "protocol": "freedom",
    "settings": {}
  },
  {
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  },
  {
    "tag": "WARP_OUT",
    "protocol": "socks",
    "settings": {
      "servers": [
        {
          "address": "127.0.0.1",
          "port": 49999
        }
      ]
    },
    "streamSettings": {
      "network": "tcp"
    }
  }
]
```
***



![image](https://user-images.githubusercontent.com/120102306/230755547-9c4d581b-4de4-499e-99e2-2d730796f50d.png)


***


# - تغییرات در مسیردهی یا روتینگ

- قدم دوم ، ایجاد مسیر استفاده از پروکسی برای سایت های خاص


طبق متن زیر ، قسمت routing رو ویرایش میکنیم


```
{
  "log": {
    "loglevel": "warning",
    "access": "./access.log"
  },
  "api": {
    "services": [
      "HandlerService",
      "LoggerService",
      "StatsService"
    ],
    "tag": "api"
  },
  "inbounds": [
    {
      "listen": "127.0.0.1",
      "port": 62789,
      "protocol": "dokodemo-door",
      "settings": {
        "address": "127.0.0.1"
      },
      "tag": "api"
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom",
      "settings": {}
    },
    {
      "protocol": "blackhole",
      "settings": {},
      "tag": "blocked"
    },
    {
      "tag": "WARP_OUT",
      "protocol": "socks",
      "settings": {
        "servers": [
          {
            "address": "127.0.0.1",
            "port": 49999
          }
        ]
      },
      "streamSettings": {
        "network": "tcp"
      }
    }
  ],
  "policy": {
    "levels": {
      "0": {
        "statsUserUplink": true,
        "statsUserDownlink": true
      }
    },
    "system": {
      "statsInboundDownlink": true,
      "statsInboundUplink": true
    }
  },
  "routing": {
    "rules": [
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "type": "field",
        "outboundTag": "WARP_OUT",
        "domain": [
          "geosite:netflix",
          "geosite:disney",
          "geosite:spotify",
          "geosite:youtube",
          "geosite:hulu",
          "geosite:hbo",
          "geosite:bbc",
          "geosite:fox",
          "geosite:google",
          "domain:openai.com",
          "domain:ai.com"
        ]
      },
      {
        "ip": [
          "geoip:private"
        ],
        "outboundTag": "blocked",
        "type": "field"
      },
      {
        "outboundTag": "blocked",
        "protocol": [
          "bittorrent"
        ],
        "type": "field"
      }
    ]
  },
  "stats": {}
}

```


برای اضافه کردن سایت از 


مثال برای اضافه کردن سایت facebook.com
```
"domain:facebook.com"
```

استفاده میکنیم و برای geosite ها از متن زیر استفاده میکنیم

مثال برای سایت های نت فلیکس
```
"geosite:netflix"
```


***

 - Save and Restart the panel

![image](https://user-images.githubusercontent.com/120102306/230755626-a773edf7-9953-4615-866c-8cea4cbd0da3.png)

***


### نمونه فایل [config
](https://github.com/ExtremeDot/vpn_setups/blob/main/FullSteps/routing/V2RAY/config-sample.json)
