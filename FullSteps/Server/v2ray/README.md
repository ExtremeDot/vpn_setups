
- ### نصب پنل سرور V2ray

- #### Setup SSL using acme

 - goto your cloudflare account, update domain and ip address , **no proxies**
  - ping domain to be sure it will return your VPS ip.

```
ping yourdomain.com 
```

- #### using my script


```
curl -O https://raw.githubusercontent.com/ExtremeDot/golden_one/master/extremeDOT.sh && chmod +x extremeDOT.sh

mv extremeDOT.sh /bin/extremeDOT && chmod +x /bin/extremeDOT

extremeDOT
```

![image](https://user-images.githubusercontent.com/120102306/230754304-28b409e3-bbe2-4741-a189-eb43ff8fe355.png)

 - 7) Input Domain and Email Address
  - NEW SERVER: Please enter damain address: **yourdomain.com**
  - NEW SERVER: Please enter E-MAIL address: **myemail.gmail.com**

 - 4)  Install Certificate USING ACME
  - Domain name and Email Address are correct? [y/n]: **y**
   -  the keys will store here


```
/root/cert.crt
/root/private.key
```

 - #### Installing Panel

![image](https://user-images.githubusercontent.com/120102306/230754445-f1835693-4f75-4a5a-929f-cbcb93c67e8b.png)

 - im using [3X-UI panel](https://github.com/MHSanaei/3x-ui)
  - 19) Sanae 3X-UI Panel
  - Do you want to continue with the modification [y/n]? : **y**
  - Please set up your username: **admin**
  - Please set up your password: **password**
  - Please set up the panel port: **54321**


Check the panel with **VPSIP:PORT**

![image](https://user-images.githubusercontent.com/120102306/230754561-29888899-8cde-4244-ab5a-4472c07e1841.png)

