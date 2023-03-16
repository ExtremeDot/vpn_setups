```sh
wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssrmu.sh && chmod +x ssrmu.sh && bash ssrmu.sh
```

![image](https://user-images.githubusercontent.com/120102306/225564340-2a48e9aa-0dd6-42d2-8820-49d5619a6640.png)


ShadowsocksR MuJSON one-click management script [v1.0.26]
   ---- Toyo | doub.io/ss-jc60 ----

   1. Install ShadowsocksR
   2. Update ShadowsocksR
   3. Uninstall ShadowsocksR
   4. Install libsodium(chacha20)
———————————
   5. View account information
   6. Display connection information
   7. Setup User Configuration
   8. Manually modify the configuration
   9. Configure traffic clear
———————————
  10. Start ShadowsocksR
  11. Stop ShadowsocksR
  12. Restart ShadowsocksR
  13. View ShadowsocksR logs
———————————
  14. Other functions
  15. Upgrade script
 
  Current status: Not installed

Please enter a number [1-15]:

***

```sh
1. 安装 ShadowsocksR
```
![image](https://user-images.githubusercontent.com/120102306/225564716-bc879b70-2510-4948-921a-df0014646e6a.png)

Please enter a number [1-15]: 1
[INFO] Starting to set up ShadowsocksR account configuration...
Please enter the server IP or domain name to be displayed in the user configuration (when the server has multiple IPs, you can specify the IP or domain name displayed in the user configuration)
(The default automatically detects the external network IP):


Hit Enter to Detect IP Automatically

***

![image](https://user-images.githubusercontent.com/120102306/225564778-ef5f2dc7-c9af-4176-8394-e738d0c2aafe.png)

Please enter the user name you want to set (do not repeat, it is used to distinguish, Chinese characters and spaces are not supported, and an error will be reported!)
(default: doubi):

***

![image](https://user-images.githubusercontent.com/120102306/225565096-9b91fb74-68a0-4641-a524-7abd79cd747a.png)



Please enter the user port to be set (do not repeat, for distinction)
(default: 2333):

***

![image](https://user-images.githubusercontent.com/120102306/225565269-38f3b1ad-a893-4c66-ae82-4e06c9580ecb.png)


Please enter the user password to be set
(Default: doub.io):

***

![image](https://user-images.githubusercontent.com/120102306/225566150-efeedf1e-5aca-4816-aba9-b58334a0dbe1.png)



1. none
  [Note] If you use the auth_chain_* series of protocols, it is recommended to select none for the encryption method (this series of protocols comes with RC4 encryption), and the confusion is free
 
   2. rc4
   3. rc4-md5
   4. rc4-md5-6
 
   5. aes-128-ctr
   6. aes-192-ctr
   7. aes-256-ctr
 
   8. aes-128-cfb
   9. aes-192-cfb
  10. aes-256-cfb
 
  11. aes-128-cfb8
  12. aes-192-cfb8
  13. aes-256-cfb8
 
  14. salsa20
  15. chacha20
  16. chacha20-ietf
  [Note] The salsa20/chacha20-* series of encryption methods require additional installation of libsodium, otherwise ShadowsocksR cannot be started!

(Default: 5. aes-128-ctr):

***

![image](https://user-images.githubusercontent.com/120102306/225566449-0796a541-702e-4f17-a4d4-fdfd12ee6132.png)



Please select the user agreement plug-in to be set

  1. origin
  2. auth_sha1_v4
  3. auth_aes128_md5
  4. auth_aes128_sha1
  5. auth_chain_a
  6. auth_chain_b
  [Note] If you use the auth_chain_* series of protocols, it is recommended to select none for the encryption method (this series of protocols comes with RC4 encryption), and the confusion is free

(Default: 3. auth_aes128_md5):

***

![image](https://user-images.githubusercontent.com/120102306/225566604-289a74a0-c3d4-4c1a-838e-cd94c2b2090a.png)


Please select the user to configure the obfuscation plugin

  1. plain
  2. http_simple
  3. http_post
  4. random_head
  5. tls1.2_ticket_auth
  [Note] If you use ShadowsocksR to proxy the game, it is recommended to choose obfuscation compatible with the original version or plain obfuscation, and then the client selects plain, otherwise the delay will increase!
  In addition, if you choose tls1.2_ticket_auth, then the client can choose tls1.2_ticket_fastauth, which can pretend without adding delay!
  If you are building in popular areas such as Japan and the United States, then choosing plain may be less likely to be confused by the wall!

(default: 1. plain):

***

![image](https://user-images.githubusercontent.com/120102306/225567513-f353ecce-ca4c-4c23-acb5-adf851e84ce2.png)


Please enter the user you want to set and the number of devices you want to limit (the auth_* series protocol is not compatible with the original version to be valid)
[Note] Limitation on the number of devices: the number of clients that can be connected to each port at the same time (multi-port mode, each port is calculated independently), at least 2 are recommended.
(default: unlimited):



Please enter the user to be set Single-threaded upper limit of speed limit (unit: KB/S)
[Note] Single-thread speed limit: the upper limit of the speed limit of each port single-thread, multi-thread is invalid.
(default: unlimited):


Please enter the total speed of the user to be set, the upper limit of the speed limit (unit: KB/S)
[Note] Port total speed limit: the total speed of each port is the upper limit of the speed limit, and the overall speed limit of a single port.
(default: unlimited):


Please enter the upper limit of the total traffic available to the user to be set (unit: GB, 1-838868 GB)
(default: unlimited):

Please enter the user to be set and the port that is forbidden to access
[Note] Prohibited ports: For example, if access to port 25 is not allowed, users will not be able to access mail port 25 through the SSR proxy. If 80,443 is prohibited, users will not be able to access http/https websites normally.
Block a single port Format: 25
Block multiple ports Format: 23,465
Ban port segment format: 233-266
Block multiple format ports: 25,465,233-666 (without the colon:)
(The default is empty and does not prohibit access to any ports):

***

CREDIT : https://github.com/ToyoDAdoubi/doubi

