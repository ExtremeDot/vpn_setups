### Install docker on 20.04 - Method A

```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```


```
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
#### alternative : if error 

```
echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu jammy stable" |sudo tee /etc/apt/sources.list.d/docker-ce.list

```



```
sudo apt update
```



```
apt-cache policy docker-ce
```


```
apt install docker-ce
```

```
sudo systemctl status docker
```

```
docker-version
```

***


```
 sudo systemctl start docker

```


```
 sudo systemctl enable docker
 
 ```
 
 ```
 sudo systemctl restart docker

```


