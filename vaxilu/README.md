
```sh
curl -O https://raw.githubusercontent.com/ExtremeDot/golden_one/master/extremeDOT.sh && chmod +x extremeDOT.sh

mv extremeDOT.sh /bin/extremeDOT && chmod +x /bin/extremeDOT
```

![image](https://user-images.githubusercontent.com/120102306/227279766-363c3255-0ef9-4407-9710-aafbc49e9403.png)

***

`
2)  Install XAN MOD KERNEL
`

***

* cloudflare : setup New Domain with IP

dash.cloudflare.com

***

* make Certificate

`
7) Input Domain and Email Address

`

`
4)  Install Certificate USING ACME
`

![image](https://user-images.githubusercontent.com/120102306/227280472-3a9b4122-98ed-4ce7-9190-9117de209f74.png)

***

`
11) Install VAXILU v2RAY X-UI Panel 
`

```sh
确认是否继续?[y/n]:
``

`
y
`

user name:

`
请设置您的账户名:
`

password

`
请设置您的账户密码:
`

port

`
请设置面板访问端口:
`

`
4430
`

```sh
ufw allow 4430
```

***

V2ray panel

![image](https://user-images.githubusercontent.com/120102306/227283440-7fe06b5d-02ca-424b-8194-2124d897120a.png)


```sh
/root/cert.crt
```

```sh
/root/private.key
```

***

### add iran geo data

```sh
{
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
    }
  ],
  "policy": {
    "system": {
      "statsInboundDownlink": true,
      "statsInboundUplink": true
    }
  },
  "routing": {
    "domainStrategy": "IPIfNonMatch",
    "rules": [
      {
        "inboundTag": [
          "api"
        ],
        "outboundTag": "api",
        "type": "field"
      },
      {
        "ip": [
          "geoip:private",
          "geoip:ir"
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


