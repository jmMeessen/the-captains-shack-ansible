# How to make it work

## Initial assumptions

- Run from an OSX mac
- Initial test with Vagrant

## Environment setup
 
-  install Virtual Box and Vagrant
- create test image (see vagrant file)
- Install Ansible
    - `sudo easy_install pip`
    - `sudo pip install ansible --quiet`
    - (`sudo pip install ansible --upgrade` to upgrade Ansible)
- Install Security Role made by geerlingguy
    - `ansible-galaxy install geerlingguy.security`
    - `ansible-galaxy install geerlingguy.repo-epel`
