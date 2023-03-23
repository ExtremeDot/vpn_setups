
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

## make Certificate

### Using ACME
`
7) Input Domain and Email Address

`

`
4)  Install Certificate USING ACME
`

![image](https://user-images.githubusercontent.com/120102306/227280472-3a9b4122-98ed-4ce7-9190-9117de209f74.png)


### USNING CERTBOT

```sh
snap install --classic certbot
```

```sh
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

```sh
sudo certbot certonly --standalone
```

![image](https://user-images.githubusercontent.com/120102306/227290437-cda52a29-a30c-4b0e-8366-fb12e63292e8.png)


enter your email

![image](https://user-images.githubusercontent.com/120102306/227290836-5b38298c-bd8e-466c-9105-1da2982bd566.png)


Select Y

![image](https://user-images.githubusercontent.com/120102306/227291000-073f9d2f-6a0a-4fe1-8b4d-6828a16732ea.png)


Select Y

![image](https://user-images.githubusercontent.com/120102306/227291224-7e68cc49-a5ad-48e5-9bd4-fbb76780135c.png)


Enter Domain Name

```sh
Successfully received certificate.
Certificate is saved at: /etc/letsencrypt/live/extremedot.com/fullchain.pem
Key is saved at:         /etc/letsencrypt/live/extremedot.com/privkey.pem
This certificate expires on 2023-06-21.
These files will be updated when the certificate renews.
Certbot has set up a scheduled task to automatically renew this certificate in the background.

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
If you like Certbot, please consider supporting our work by:
 * Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
 * Donating to EFF:                    https://eff.org/donate-le
- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
```

your cert:     :/etc/letsencrypt/live/extremedot.com/fullchain.pem
your prive key :/etc/letsencrypt/live/extremedot.com/privkey.pem


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


