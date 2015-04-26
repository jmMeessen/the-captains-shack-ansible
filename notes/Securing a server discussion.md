#Securing a server discussion

- http://www.tldp.org/LDP/lame/LAME/linux-admin-made-easy/security.html
- hardening Ubuntu : http://blog.mattbrock.co.uk/hardening-the-security-on-ubuntu-server-14-04/


## SSH key management
- http://security.stackexchange.com/questions/18926/best-practice-one-per-user-ssh-key-or-multiple-per-host-ssh-keys
- http://www.codero.com/knowledge-base/questions/300/How+to+use+public+key+authentication+with+SSH+users
- White Paper about securing SSH key's: http://www.cyberark.com/resource/discover-keys-securing-ssh/
- http://security.stackexchange.com/questions/10963/whats-the-common-pragmatic-strategy-for-managing-key-pairs
- OWASP about certificate pinning: https://www.owasp.org/index.php/Certificate_and_Public_Key_Pinning (With a mobile bias)
- https://derpops.bike/2014/06/07/ssh-key-rotation-with-ansible/
- https://serversforhackers.com/ssh-tricks
- http://serverfault.com/questions/545978/how-to-handle-ssh-port-changes-with-ansible

## Two-factor SSH authentication

- https://wiki.archlinux.org/index.php/Google_Authenticator
- https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-two-factor-authentication
- http://www.howtogeek.com/121650/how-to-secure-ssh-with-google-authenticators-two-factor-authentication/
- Podcast about 2 factor auth: http://hackerpublicradio.org/eps.php?id=1161

### Ansible and two-factor SSH authentication

- It doesn't really work : https://github.com/ansible/ansible/issues/10065 
- Somebody describes a workarount: http://stackoverflow.com/questions/23115619/how-to-use-ansible-with-two-factor-authentication
- http://coder36.blogspot.be/2014/12/raspberry-pi-vpn-with-google.html



