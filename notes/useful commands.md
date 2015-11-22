# useful commands

* connect with SSH as a specific user on a specific port: `ssh jmm@the-captains-shack.com -p 2222`
* change personality as root `sudo -s`
* To dry run a play book, use parameters `--check --diff`
* to display the uncommented lines of a configuration file `grep "^[^#;]" /etc/ssh/sshd_config | sort`
* checking if a port is correctly firewalled: `nc 127.0.0.1 123 < /dev/null; echo $?`. It will output 0 if port 123 is open, and 1 if it's closed.
* check what RPM versions are available : `repoquery --show-duplicates docker-engine*` 