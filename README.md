#docker-steam

A docker with steam preconfigured inside.  
Configure your `steamcmd.cmd` to run your dedicated server.  

## Dependency

- [Docker](https://www.docker.com/)  
  - [Mac OS X](https://docs.docker.com/installation/mac/)  
  - [Ubuntu](https://docs.docker.com/installation/ubuntulinux/)  
  - [Red Hat Enterprise Linux](https://docs.docker.com/installation/rhel/)
  - [CentOS](https://docs.docker.com/installation/centos/)
  - [Debian](https://docs.docker.com/installation/debian/)
  - [Gentoo](https://docs.docker.com/installation/gentoolinux/)
  - [Google Cloud Platform](https://docs.docker.com/installation/google/)
  - [Rackspace Cloud](https://docs.docker.com/installation/rackspace/)
  - [Amazon EC2](https://docs.docker.com/installation/amazon/)
  - [IBM Softlayer](https://docs.docker.com/installation/softlayer/)
  - [Arch Linux](https://docs.docker.com/installation/archlinux/)
  - [FrugalWare](https://docs.docker.com/installation/frugalware/)
  - [Fedora](https://docs.docker.com/installation/fedora/)
  - [openSUSE](https://docs.docker.com/installation/openSUSE/)
  - [CRUX Linux](https://docs.docker.com/installation/cruxlinux/)
  - [Microsoft Windows](https://docs.docker.com/installation/windows/)


## Install it

```bash
git clone https://github.com/Micka33/docker-steam.git
cd docker-steam
sudo docker build -t mysteamserver ./docker_files
```

## Run it

```bash
sudo docker run -d -p 27015:27015 -p 27016:27016 -p 27017:27017 -p 27018:27018 -p 27019:27019 -p 27020:27020 -p 27021:27021 -p 27022:27022 -p 27023:27023 -p 27024:27024 -p 27025:27025 -p 27026:27026 -p 27027:27027 -p 27028:27028 -p 27029:27029 -p 27030:27030 -p 27031:27031 -p 27032:27032 -p 27033:27033 -p 27034:27034 -p 27035:27035 -p 27036:27036 -p 54168:54168 -p 27005:27005 -p 26901:26901   -p 27015:27015/udp -p 27016:27016/udp -p 27017:27017/udp -p 27018:27018/udp -p 27019:27019/udp -p 27020:27020/udp -p 27021:27021/udp -p 27022:27022/udp -p 27023:27023/udp -p 27024:27024/udp -p 27025:27025/udp -p 27026:27026/udp -p 27027:27027/udp -p 27028:27028/udp -p 27029:27029/udp -p 27030:27030/udp -p 27031:27031/udp -p 27032:27032/udp -p 27033:27033/udp -p 27034:27034/udp -p 27035:27035/udp -p 27036:27036/udp -p 54168:54168/udp -p 27005:27005/udp -p 26901:26901/udp -v `pwd`/mounted:/root/mounted mysteamserver
```

*for inspection/debug, use this command*
```bash
sudo docker run --rm -ti -p 27015:27015 -p 27016:27016 -p 27017:27017 -p 27018:27018 -p 27019:27019 -p 27020:27020 -p 27021:27021 -p 27022:27022 -p 27023:27023 -p 27024:27024 -p 27025:27025 -p 27026:27026 -p 27027:27027 -p 27028:27028 -p 27029:27029 -p 27030:27030 -p 27031:27031 -p 27032:27032 -p 27033:27033 -p 27034:27034 -p 27035:27035 -p 27036:27036 -p 54168:54168 -p 27005:27005 -p 26901:26901   -p 27015:27015/udp -p 27016:27016/udp -p 27017:27017/udp -p 27018:27018/udp -p 27019:27019/udp -p 27020:27020/udp -p 27021:27021/udp -p 27022:27022/udp -p 27023:27023/udp -p 27024:27024/udp -p 27025:27025/udp -p 27026:27026/udp -p 27027:27027/udp -p 27028:27028/udp -p 27029:27029/udp -p 27030:27030/udp -p 27031:27031/udp -p 27032:27032/udp -p 27033:27033/udp -p 27034:27034/udp -p 27035:27035/udp -p 27036:27036/udp -p 54168:54168/udp -p 27005:27005/udp -p 26901:26901/udp -v `pwd`/mounted:/root/mounted mysteamserver /sbin/my_init  -- bash -l
```



## About it

Currently, this docker is configured to run a **Classic Competitive CS:GO dedicated server**.

## How to run another dedicated server ?

2 files need to be modified, `steamcmd.cmd` and `run_server.sh`.  


[docker_files/steamcmd.cmd](https://github.com/Micka33/docker-steam/blob/master/docker_files/steamcmd.cmd)
```
// anonymous login is required in order to download CS:GO
// see https://developer.valvesoftware.com/wiki/SteamCMD#Automating_SteamCMD
// for more info
login anonymous

// Where all the files will be stored
// Don't change, unless you know what you are doing
force_install_dir /root/mounted/

// See https://developer.valvesoftware.com/wiki/Dedicated_Servers_List#Linux_Dedicated_Servers
// to find your dedicated server ID
// 740: Counter-Strike: Global Offensive Dedicated Server
app_update 740 validate

//It should always end by quit
quit
```

Change the steam application id `740` to yours. [here](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List#Linux_Dedicated_Servers) is a list of all steam application IDs.

Some dedicated server require to be logged in.  
Change like the following:
```
//login anonymous
@NoPromptForPassword 1
login <username> <password>
```

---


[docker_files/run_server.sh](https://github.com/Micka33/docker-steam/blob/master/docker_files/run_server.sh)
```bash
#!/bin/sh
cd /root/mounted

# Classic Casual
# exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 0 +mapgroup mg_active
# Classic Competitive
exec ./srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_bomb_se
# Arms Race
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 0 +mapgroup mg_armsrace
# Demolition
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 1 +mapgroup mg_demolition
# Deathmatch
# exec ./srcds_run -game csgo -console -usercon +game_type 1 +game_mode 2 +mapgroup mg_allclassic
```

There are some examples CS:GO modes already configured in this file.  
Be sure to always run your server using `exec`.  

Refer to the approriate steam server configuration page. See [this link](https://developer.valvesoftware.com/wiki/Steam_Application_IDs#Server_Files), and [this link](https://developer.valvesoftware.com/wiki/Dedicated_Servers_List#Linux_Dedicated_Servers) for all servers.