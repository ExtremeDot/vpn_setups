```
wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
```

***
ست کردن bbr روی کرنل

گزینه 19
بعد گزینه 1
```
BBR、DD脚本用的[ylx2016]的成熟作品，地址[https://github.com/ylx2016/Linux-NetSpeed]，请熟知 
1.安装脚本【推荐原版BBR+FQ】 
2.回退主目录 
============================================================== 
请选择:

```


```

 TCP加速 一键安装管理脚本 [v100.0.1.19] from blog.ylx.me 母鸡慎用
 0. 升级脚本
 9. 切换到不卸载内核版本        10. 切换到一键DD系统脚本
 1. 安装 BBR原版内核
 2. 安装 BBRplus版内核          5. 安装 BBRplus新版内核
 3. 安装 Lotserver(锐速)内核    6. 安装 xanmod版内核
 11. 使用BBR+FQ加速             12. 使用BBR+FQ_PIE加速 
 13. 使用BBR+CAKE加速
 14. 使用BBR2+FQ加速            15. 使用BBR2+FQ_PIE加速 
 16. 使用BBR2+CAKE加速
 17. 开启ECN                    18. 关闭ECN
 19. 使用BBRplus+FQ版加速 
 20. 使用Lotserver(锐速)加速 
 21. 系统配置优化               22. 应用优化方案2
 23. 禁用IPv6                   24. 开启IPv6
 25. 卸载全部加速               99. 退出脚本 
————————————————————————————————————————————————————————————————
 系统信息: Ubuntu 22.10  Microsoft Hyper-V x86_64 5.19.0-29-generic 
 当前状态: 已安装 BBR 加速内核 , BBR启动成功
 当前拥塞控制算法为: bbr 当前队列算法为: fq 
 请输入数字 :

```
گزینه 5

در انتها ازت میپرسه برا ریستارت، وقتی ریستارت کردی، دوباره همین مراحل رو بیا، اگه کرنل عوض شده باشه، این خط عوض میشه

```
 系统信息: Ubuntu 22.10  Microsoft Hyper-V x86_64 5.19.0-29-generic
 ```
 مثلا برا من شده این
 
 ```
 系统信息: Ubuntu 22.10  Microsoft Hyper-V x86_64 6.2.7-bbrplus 
 ```
 که نشون میده کرنل شده 6.2.7 bbr plus
 
 

***
ساخت کانفیگ

برای اجرای اسکریپت میزنیم 

```
vsama
```


- 1.安装 

1.Xray-core

```
进度  3/13 : 初始化Nginx申请证书配置 

请输入要配置的域名 例: www.v2ray-agent.com ---> 
域名:
```
آدرس ساب دامین رو وارد میکنیم

```
请输入端口[默认: 443]，可自定义端口[回车使用默认] 
端口:
```
اینجا پورت پیش فرض برای سایت فیک رو میپرسه، همون 443 رو انتخاب کنید و یا میتونید اگه 443 قبلا استفاده شده یه چیز دیگه وارد کنیم
پورت رو وارد میکنیم، مثلا 17824

```
进度  4/13 : 申请TLS证书
 
 ---> 安装TLS证书 

============================================================== 
1.letsencrypt[默认] 
2.zerossl 
3.buypass[不支持DNS申请] 
============================================================== 
请选择[回车]使用默认:
```

ساخت گواهی SSL

1.letsencrypt[默认] 

```
进度  5/13 : 生成随机路径 
请输入自定义路径[例: alone]，不需要斜杠，[回车]随机路径 
路径:
```

وارد کردن یک کلمه برای مسیر ws

مثلا database


```
# 注意事项 

教程地址: 
https://www.v2ray-agent.com/archives/cloudflarezi-xuan-ip 

如对Cloudflare优化不了解，请不要使用 

 1.CNAME www.digitalocean.com 
 2.CNAME who.int 
 3.CNAME blog.hostmonit.com 
---------------------------- 
请选择[回车不使用]:
```

انتخاب سایت جهت مخفی نمودن ترافیک 

 2.CNAME who.int 
 
 
 ```
 进度 9/13 : 初始化Xray配置 

请输入自定义UUID[需合法]，[回车]随机UUID 
UUID:
```

بدون وارد کردن، Enter  روی میزنیم


```
===================== 配置VLESS+Reality =====================
 
是否使用TLS+Vision端口 ？[y/n]:
```

n

```
请输入端口[回车随机10000-60000] 
端口:
````
12485

اینجا کانفیگ ها رو میسازه

***

برای ایجاد سایت فیک

دوباره اسکریپت رو اجرا میکینم

```
vasma
```

گزینه 7

```
7.更换伪装站 
```

```
# 如需自定义，请手动复制模版文件到 /usr/share/nginx/html/ 
 
1.新手引导 
2.游戏网站 
3.个人博客01 
4.企业站 
5.解锁加密的音乐文件模版[https://github.com/ix64/unlock-music] 
6.mikutap[https://github.com/HFIProgramming/mikutap] 
7.企业站02 
8.个人博客02 
9.404自动跳转baidu 
10.302重定向网站 

```

# For customization, please manually copy the template file to /usr/share/nginx/html/
 
1. Novice guide
2. Game site
3. Personal blog 01
4. Enterprise website
5. Unlock the encrypted music file template [https://github.com/ix64/unlock-music]
6.mikutap[https://github.com/HFIProgramming/mikutap]
7. Enterprise station 02
8. Personal blog 02
9.404 automatically jump to baidu
10.302 Redirecting Sites

یکی از این قالب ها رو برای سایت انتخاب کنید

***


نصب پنل xray

```
bash <(curl -Ls  https://raw.githubusercontent.com/qist/xray-ui/main/install.sh)
```

```
以下设置内容建议自定义，以防止账号密码及端口泄露

设置xray-ui登录用户名（回车跳过为随机6位字符）：
```

username

```
设置xray-ui登录密码（回车跳过为随机6位字符）：
```

password

```
设置xray-ui登录端口[1-65535]（回车跳过为2000-65535之间的随机端口）：
```

port

```
ufw disable
```



