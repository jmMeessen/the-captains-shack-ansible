#IPtable manipulations

- see http://www.hashbangcode.com/blog/adding-iptables-rules-ansible
- see also http://stackoverflow.com/questions/24756240/how-can-i-use-iptables-on-centos-7

The IPtable stuff is replaced by "firewall-cmd".  I had to install it on the system with "yum install firewalld"

- http://docs.ansible.com/firewalld_module.html describes the ansible module to manipulate firewald
- http://www.certdepot.net/rhel7-get-started-firewalld/ or http://searchdatacenter.techtarget.com/tip/A-few-ways-to-configure-Linux-firewalld
- to list active rules for a zone : `firewall-cmd --zone=public --list-all`
- to list the available services : `firewall-cmd --list-services`

The rules loaded by default on Vagrant are:

```
[vagrant@localhost ~]$ firewall-cmd --get-active-zones
public
  interfaces: enp0s3
[vagrant@localhost ~]$ firewall-cmd --zone=public --list-all
public (default, active)
  interfaces: enp0s3
  sources: 
  services: dhcpv6-client ssh
  ports: 
  masquerade: no
  forward-ports: 
  icmp-blocks: 
  rich rules: 
```
