- #### Import Cloudflare Proxy Server into V2RAY Config

 - goto V2ray Panel 
  - Panel Settings
   - Xray Configuration

***
## - تغییرات در outbounds
- Step 1: Configuration of Outbounds

edit it as below 
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

![image](https://user-images.githubusercontent.com/120102306/230755547-9c4d581b-4de4-499e-99e2-2d730796f50d.png)


***

# - تغییرات در مسیردهی یا روتینگ
   - Step 2: Configuration of Routing rules

edit as below

```
[
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
      "geosite:google"
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

```

 - Save and Restart the panel

![image](https://user-images.githubusercontent.com/120102306/230755626-a773edf7-9953-4615-866c-8cea4cbd0da3.png)

