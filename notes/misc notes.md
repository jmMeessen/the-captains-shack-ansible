# Some miscellanous notes

## vagrant shared directory error.

When starting the Centos7 box, I had the following error

```
  Failed to mount folders in Linux guest. This is usually because
  the "vboxsf" file system is not available. Please verify that
  the guest additions are properly installed in the guest and
  can work properly. The command attempted was:
  
  mount -t vboxsf -o uid=`id -u vagrant`,gid=`getent group vagrant | cut -d: -f3` vagrant /vagrant
  mount -t vboxsf -o uid=`id -u vagrant`,gid=`id -g vagrant` vagrant /vagrant
  
  The error output from the last command was:
  
  /sbin/mount.vboxsf: mounting failed with the error: No such device
```

This was solved by issuing the following command that forces the (re)installation of the guest addons `vagrant plugin install vagrant-vbguest`

## installing Ansible on Mac OSX

[Install instruction](https://devopsu.com/guides/ansible-mac-osx.html)

## configuring the yum-cron
 - change to security and apply security patches
 - `sed -ie 's/apply_updates = no/apply_updates = yes/' /etc/yum/yum-cron.conf`
 
## Configuration of GOACCESS

`docker run --rm -it -v logVolume:/var/log/nginx joelchen/goaccess`

`docker run --rm -it -v logVolume:/var/log/nginx jmm/goaccess goaccess -f /var/log/nginx/access2.log` 

docker file

````
FROM joelchen/goaccess

ADD goaccess.conf /usr/local/etc/goaccess.conf
````

goaccess.conf

````
time_format %H:%M:%S
date_format %d/%b/%Y
log_format %v:%h - %^ [%d:%t %^] "%r" %s %b "%R" "%u" %^
````

##OpenVPN

docker volume create --name ovpn-data
xzcat openvpn-backup.tar.xz | docker run --rm  -v ovpn-data:/etc/openvpn -i busybox tar -xvf - -C /etc

xzcat openvpn-backup.tar.xz | docker run --rm -v ovpn-data:/etc/openvpn -i busybox tar -xvf - -C /etc

