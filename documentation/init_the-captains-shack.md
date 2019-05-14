# Re-initialize checklist for the-captains-shack.com 

## Pre-fligh checks
- [ ] Check that the fixed ip is still `5.135.185.7`. Otherwise, change it in the `kimsufi_bootstrap.sh` script.
- [ ] Check that the correct docker versions are set for the docker engine et docker compose. (see https://github.com/moby/moby/blob/master/CHANGELOG.md and https://github.com/docker/compose/blob/master/CHANGELOG.md). These values are set in `roles/docker/vars/docker-vars.yml`.

## Main Installation
- [ ] Request a re-init of the server via the Kimsufi console. Choose `CentOS 7` in English.
- [ ] Wait for the new password to be sent by mail. Copy it .
- [ ] Start the bootstrap Ansible script `kimsufi_bootstrap.sh`. The script asks for the new root password (just past it) and the ansible-vault password.
- [ ] Connect to the server with `ssh jmm@the-captains-shack.com`, 
- [ ] Restore the gogs backup and the ssh keys with the `sudo /home/data/backup/restore.sh` command. (directory agnostic, sudo and CHOWN has not been tested yet)

## Requesting new certificates
- [ ] Connect to the server, sudo as root with `sudo su`, move to the `/home/data/docker/` directory and execute `./request_certificates.sh`.

## Restart the openVPN
- [ ] Transfer a copy of the VPN setting (ex: `scp openvpn-backup.tar.xz jmm@the-captains-shack.com:openvpn-backup.tar.xz`
- [ ] On the server execute, `/home/data/openVPN/restoreOpenVPNsettings.sh`
- [ ] Start the OpenVPN service with `/home/data/openVPN/startOpenVPN.sh`

## Checking the system
- Webserver
- git
- ci
- vpn
- check backup

Note: it might be necessary to install `sshpass`. On OSX use de command `brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb`
