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
