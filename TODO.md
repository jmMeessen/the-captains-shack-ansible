#TODO

## Sprint 1

**Objective**: Learn Ansible and automate Centos7 setup on Vagrant box

- [x] Install & Setup Ansible
- [x] How to configure Centos' firewall (open new port)
- [x] Create users
    - [x] dadou
    - [x] jmm
- [x] setup SSH access for dito
- [x] Assign new users to sudo group
- [x] Set the time to Central European Time
- [ ] reconfigure SSH/SSHD by creating a SSHD configuration file
    - [ ] Configure deported SSH port (`Port 10022`)
    - [x] SSH - Deactivate Root access (`PermitRootLogin no`)
    - [x] SSH - Deactivate X11 forwarding  (`X11Forwarding no`)
    - [x] SSH - Deactivate SFTP. Might conflict with Ansible.
    - [x] SSH - Deactivate Password authentication
    - [ ] SSH - Activate port/socket forwarding 
- [ ] Désactiver le mode execution dans /tmp
- [ ] Install BATS

The first step will be to activate two factor authentication for regular user and public key auth for the ansible (vagrant) account
The next step will be to enable openVPN. It will require a two step installation.

Note: All setup steps or milestone should be testable (BATS)

## Sprint 1b

**Objectives**: further improve the security

- [ ] install and configure AIDE
    - [ ] enable AIDE reporting via mail
- [ ] enable OpenVPN
- [ ] if user already exist, don't reset the password

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




