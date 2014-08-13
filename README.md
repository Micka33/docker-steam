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


## Run it

```bash
sudo docker build -t mysteamserver .
sudo docker run --rm -d -v `pwd`:/root/mounted mysteamserver
```
