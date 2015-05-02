#Securing a server discussion

- http://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/security.html
- hardening Ubuntu : http://blog.mattbrock.co.uk/hardening-the-security-on-ubuntu-server-14-04/


## Securing SSH and SSH keys
- [Setting up SSH with Ansible](http://www.hashbangcode.com/blog/ansible-ssh-setup-playbook). An article describing 
the initial setup of an ansible remote user (with SSH auth), automated with a cookbook. It uses the upload of an 
authorized key.  
- A CentOS community article about [securing SSH](http://wiki.centos.org/HowTos/Network/SecuringSSH). It covers 
    - Use Strong Passwords/Usernames
    - Disable Root Logins
    - Limit User Logins
    - Disable Protocol 1
    - Use a Non-Standard Port
    - Filter SSH at the Firewall
    - Use Public/Private Keys for Authentication
    - Frequently Asked Question (FAQ)
- [What's the common pragmatic strategy for managing key pairs?](http://security.stackexchange.com/questions/10963/whats-the-common-pragmatic-strategy-for-managing-key-pairs) and [SSH key best practice discussion]
(http://security.stackexchange.com/questions/18926/best-practice-one-per-user-ssh-key-or-multiple-per-host-ssh-keys)
    - The consensus goes for one single user key to be used on several servers.
    - _"I have a hard time thinking that the user experience on the many-to-many approach will be acceptable. The 
    confusion surrounding trying to remember which pub/priv key pair goes with what system seems overly cumbersome.
    The spirit of the one-to-many key approach seems best in terms of the management and user experience aspects."_
    - _" I use the same private key on my new home PC as my old home PC. I use different keys on laptops and other 
    mobile devices. This approach allows fine-grained risk management: I can revoke keys separately, and limit the 
    possibilities for my accounts to be involved in an escalated infiltration by not authorizing certain keys on 
    certain machines (I don't do that much, but it's an option for the paranoid)."_ 
    - _"I would strongly suggest you consider looking for configuration management tools like puppet/chef. 
    Both of them have methods for distributing SSH keys out to your machines.The reasons I started using puppet was 
    specifically because I wanted a good way to quickly revoke a key on my ~60 Linux servers when staff changed."_
- An entry level explanation of how [public key authentication](http://www.codero.com/knowledge-base/questions/300/How+to+use+public+key+authentication+with+SSH+users)
  works on a linux machine. Didn't learn much but a very good refresher.
- [White Paper about securing SSH key's](http://www.cyberark.com/resource/discover-keys-securing-ssh/) _"Discover the
 Keys to Securing SSH : Learn how to proactively find, secure and manage SSH keys"_. The white 
paper is used to support the sale of the ARK solution.
    - issue is that ssh keys can't be revoked and/or forced to rotate.
    - their proposal is to centraly manage these keys
    - interesting idea is the automated key usage automation: _"Organizations should use a tool that can scan their 
    environment to identify and locate all SSH keys, document the age of existing keys, map relationships between 
    users and systems, and determine which keys are within or outside of organizational policies."_.
- OWASP about certificate pinning: https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning (With a mobile bias)
- https://derpops.bike/2014/06/07/ssh-key-rotation-with-ansible/
- https://serversforhackers.com/ssh-tricks
- [Changing the SSH port with Ansible](http://serverfault.com/questions/545978/how-to-handle-ssh-port-changes-with-ansible)
    - _"Is it possible to automate this by having Ansible fallback to a specified port if the connection could not be
     established to the default SSH port?"_

## Two-factor SSH authentication

- https://wiki.archlinux.org/index.php/Google_Authenticator
- https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-two-factor-authentication
- http://www.howtogeek.com/121650/how-to-secure-ssh-with-google-authenticators-two-factor-authentication/
- Podcast about 2 factor auth: http://hackerpublicradio.org/eps.php?id=1161
- https://www.rosehosting.com/blog/how-to-secure-your-ssh-using-two-step-authentication-on-centos-6/

### Ansible and two-factor SSH authentication

- It doesn't really work : https://github.com/ansible/ansible/issues/10065 
- Somebody describes a workaround: http://stackoverflow
.com/questions/23115619/how-to-use-ansible-with-two-factor-authentication
- http://coder36.blogspot.be/2014/12/raspberry-pi-vpn-with-google.html


## Password strength
- http://theurbanpenguin.com/wp/?p=3401
- Yubico key https://www.yubico.com/products/yubikey-hardware/yubikey-2/



