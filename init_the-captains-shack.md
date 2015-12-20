#Re-initialize the-captains-shack.com checklist

- [ ] Request a re-init of the server via the Kimsufi console. Choose `CentOS 7.2` in English.
- [ ] Wait for the new password to be sent by mail. Copy it .
- [ ] Start the bootstrap Ansible script `kimsufi_bootstrap.sh`. The script asks for the new root password (just past it) 
and the ansible-vault password.
- [ ] Connect to the server with `ssh jmm@the-captains-shack.com`, 
    - [ ] Restore the gogs backup and the ssh keys with the `sudo /data/backup/restore.sh` command. (directory agnostic, sudo and CHOWN has not been tested yet)

##Requesting new certificates
- [ ] Connect to the server, sudo as root with `sudo su`, move to the `\data\docker\` directory and execute `./request_certificates.sh`.