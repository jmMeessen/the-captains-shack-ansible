#TODO

## Sprint 1

**Objective**: Learn Ansible and automate Centos7 setup on Vagrant box

- [x] Install & Setup Ansible
- [x] How to configure Centos' firewall (open new port)
- [x] Create users
    - [ ] dadou
    - [ ] jmm
    - [ ] Ansible account
- [x] setup SSH access for dito
- [x] Assign new users to sudo group
- [ ] reconfigure SSH/SSHD by creating a SSHD configuration file
    - [ ] Configure deported SSH port (`Port 10022`)
    - [x] SSH - Deactivate Root access (`PermitRootLogin no`)
    - [ ] SSH - Deactivate X11 forwarding  (`X11Forwarding no`)
    - [ ] SSH - Deactivate SFTP. Might conflict with Ansible.
    - [x] SSH - Deactivate Password authentication
    - [ ] SSH - Activate port/socket forwarding 
- [ ] Désactiver le mode execution dans /tmp

Note: All setup steps or milestone should be testable (BATS)

## Sprint 2

**Objective**: Push the automated setup to bare server

## Sprint 3

**Objective**: Experiment with SELINUX and evaluate feasability

## Sprint 4

- push simple docker containers
- etc.

## to plan

- [ ] install latest Virtualbox
- [ ] install latest Vagrant
- [ ] install latest Docker




