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
- [x] reconfigure SSH/SSHD by creating a SSHD configuration file
    - [-] Configure deported SSH port (`Port 10022`)
    - [x] SSH - Deactivate Root access (`PermitRootLogin no`)
    - [x] SSH - Deactivate X11 forwarding  (`X11Forwarding no`)
    - [x] SSH - Deactivate SFTP. Might conflict with Ansible.
    - [x] SSH - Deactivate Password authentication
    - [x] SSH - Activate port/socket forwarding 
- [x] Désactiver le mode execution dans /tmp
- [x] Install DOCKER
- [x] Install GIT


- [x] fix this bug "-bash: warning: setlocale: LC_CTYPE: cannot change locale (UTF-8): No such file or directory"

The first step will be to activate two factor authentication for regular user and public key auth for the ansible (vagrant) account
The next step will be to enable openVPN. It will require a two step installation.

Note: All setup steps or milestone should be testable (BATS)

## Sprint 2

**Objectives**: basic web presence

- [ ] Install and run NGNIX with a basic welcome page.
- [ ] Install and run a Static Site generator

## Sprint ??

**Objectives**: further improve the security

- [ ] install and configure AIDE
    - [ ] enable AIDE reporting via mail
- [ ] enable OpenVPN
- [ ] if user already exist, don't reset the password

## Sprint ??

**Objective**: Push the automated setup to bare server

## Sprint ??

**Objective**: Experiment with SELINUX and evaluate feasability

## Sprint ??

- push simple docker containers
- etc.

## to plan

- [ ] install latest Virtualbox
- [ ] install latest Vagrant




