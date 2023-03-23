# GRE TUNNEL SETUP

Based on Hetzner tutoraol on https://community.hetzner.com/tutorials/linux-setup-gre-tunnel


### check gre module support by kernel

```sh
sudo modprobe ip_gre
lsmod | grep gre
```


And you should see:

![image](https://user-images.githubusercontent.com/120102306/227245084-f62c7b20-6be3-45fb-89fd-ce6c7d26c954.png)



```sh
sudo apt install iptables iproute2
```

***

### Server A - the server that all the clients will connect to
       
       IP: 198.51.100.1
       
       GRE tunnel internal IP: 13.0.0.1
       

### Server B - the server which is actually running all the applications

       IP: 203.0.113.1
       
       GRE tunnel internal IP: 13.0.0.2
        
***

* Enable IP forwarding

```sh
sudo echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf

sudo sysctl -p
```

***

### Server A Termianl


```sh
vpsA_pub=198.51.100.1
vpsA_gre=13.0.0.1

vpsB_pub=203.0.113.1
vpsB_gre=13.0.0.2

sudo ip tunnel add gre1 mode gre local $vpsA_pub remote $vpsB_pub ttl 255
sudo ip addr add $vpsA_gre/30 dev gre1
sudo ip link set gre1 up
```

### Server B Termianl

```sh
vpsA_pub=198.51.100.1
vpsA_gre=13.0.0.1

vpsB_pub=203.0.113.1
vpsB_gre=13.0.0.2

sudo ip tunnel add gre1 mode gre local $vpsB_pub remote $vpsA_pub ttl 255
sudo ip addr add $vpsB_gre/30 dev gre1
sudo ip link set gre1 up
```

***

### Ping Test

* Server A

```sh
ping $vpsB_gre
```

* Server B

```sh
ping $vpsB_gre
```
***

