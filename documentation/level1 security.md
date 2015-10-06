#Security Level1 Checklist

This is the checklist to use to setup a Centos machine and do a basic security configuration.
The configuration is done with Ansible.

## what is done ?

- using a role that is strongly inspired by the geerlingguy.security role
    - install fail2ban and ensure that it is running when the server is rebooted
    - configure SSH
        - PasswordAuthentication no
        - PermitRootLogin no
        - X11Forwarding no
        - AllowTcpForwarding yes
        - set the SSH port
        - disable SFTP (requires `scp_if_ssh=True` in the Ansible configuration
    - add users (password behavior)
    - install, enable and configure the firewall (only SSH and IPV6 DHCP client allowed)
    - enable auto update of security patches