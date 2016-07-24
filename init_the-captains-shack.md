#Re-initialize the-captains-shack.com checklist

- [ ] Request a re-init of the server via the Kimsufi console. Choose `CentOS 7.2` in English.
- [ ] Wait for the new password to be sent by mail. Copy it .
- [ ] Start the bootstrap Ansible script `kimsufi_bootstrap.sh`. The script asks for the new root password (just past it) and the ansible-vault password.
- [ ] Connect to the server with `ssh jmm@the-captains-shack.com`, 
- [ ] Restore the gogs backup and the ssh keys with the `sudo /data/backup/restore.sh` command. (directory agnostic, sudo and CHOWN has not been tested yet)

##Requesting new certificates
- [ ] Connect to the server, sudo as root with `sudo su`, move to the `\data\docker\` directory and execute `./request_certificates.sh`.

##Restart the openVPN
- [ ] Transfer a copy of the VPN setting (ex: `scp openvpn-backup.tar.xz jmm@the-captains-shack.com:openvpn-backup.tar.xz`
- [ ] On the server execute, `/data/openVPN/restoreOpenVPNsettings.sh`
- [ ] Start the OpenVPN service with `/data/openVPN/startOpenVPN.sh`

Note: it might be necessary to install `sshpass`. On OSX use de command `brew install https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb`
