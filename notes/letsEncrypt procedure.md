# Let's encrypt certificate procedure

execute the certificate request docker container from the server it self after having cut the servers 
listening on 80 and 443 with a "docker-compose stop"


```
sudo docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest --agree-dev-preview --server \
            https://acme-v01.api.letsencrypt.org/directory auth -m jean-marc@meessen-web.org \
            -d git.the-captains-shack.com
```

The certificates are generated in `/var/letsencrypt/live/<serverName>/`  

copy the generated certificates

```
cp -R -L -v /etc/letsencrypt/live/* /var/nginx/conf/ssl/
```

## Let's encrypt documentaion (via --help all)


```
usage:
  letsencrypt [SUBCOMMAND] [options] [-d domain] [-d domain] ...

The Let's Encrypt agent can obtain and install HTTPS/TLS/SSL certificates.  By
default, it will attempt to use a webserver both for obtaining and installing
the cert. Major SUBCOMMANDS are:

  (default) run        Obtain & install a cert in your current webserver
  certonly             Obtain cert, but do not install it (aka "auth")
  install              Install a previously obtained cert in a server
  revoke               Revoke a previously obtained certificate
  rollback             Rollback server configuration changes made during install
  config_changes       Show changes made to server config during installation

optional arguments:
  -h, --help            show this help message and exit
  -c CONFIG_FILE, --config CONFIG_FILE
                        config file path (default: None)
  -v, --verbose         This flag can be used multiple times to incrementally
                        increase the verbosity of output, e.g. -vvv. (default:
                        -3)
  -t, --text            Use the text output instead of the curses UI.
                        (default: False)
  --register-unsafely-without-email
                        Specifying this flag enables registering an account
                        with no email address. This is strongly discouraged,
                        because in the event of key loss or account compromise
                        you will irrevocably lose access to your account. You
                        will also be unable to receive notice about impending
                        expiration of revocation of your certificates. Updates
                        to the Subscriber Agreement will still affect you, and
                        will be effective N days after posting an update to
                        the web site. (default: False)
  -m EMAIL, --email EMAIL
                        Email used for registration and recovery contact.
                        (default: None)
  -d DOMAIN, --domains DOMAIN
                        Domain names to apply. For multiple domains you can
                        use multiple -d flags or enter a comma separated list
                        of domains as a parameter. (default: None)
  --duplicate           Allow getting a certificate that duplicates an
                        existing one (default: False)
  --user-agent USER_AGENT
                        Set a custom user agent string for the client. User
                        agent strings allow the CA to collect high level
                        statistics about success rates by OS and plugin. If
                        you wish to hide your server OS version from the Let's
                        Encrypt server, set this to "". (default: None)

automation:
  Arguments for automating execution & other tweaks

  --version             show program's version number and exit
  --renew-by-default    Select renewal by default when domains are a superset
                        of a a previously attained cert (default: False)
  --agree-dev-preview   Agree to the Let's Encrypt Developer Preview
                        Disclaimer (default: False)
  --agree-tos           Agree to the Let's Encrypt Subscriber Agreement
                        (default: False)
  --account ACCOUNT_ID  Account ID to use (default: None)

testing:
  The following flags are meant for testing purposes only! Do NOT change
  them, unless you really know what you're doing!

  --debug               Show tracebacks in case of errors, and allow
                        letsencrypt-auto execution on experimental platforms
                        (default: False)
  --no-verify-ssl       Disable SSL certificate verification. (default: False)
  --tls-sni-01-port TLS_SNI_01_PORT
                        Port number to perform tls-sni-01 challenge. Boulder
                        in testing mode defaults to 5001. (default: 443)
  --http-01-port HTTP01_PORT
                        Port used in the SimpleHttp challenge. (default: 80)

security:
  Security parameters & server settings

  --rsa-key-size N      Size of the RSA key. (default: 2048)
  --redirect            Automatically redirect all HTTP traffic to HTTPS for
                        the newly authenticated vhost. (default: None)
  --no-redirect         Do not automatically redirect all HTTP traffic to
                        HTTPS for the newly authenticated vhost. (default:
                        None)
  --strict-permissions  Require that all configuration files are owned by the
                        current user; only needed if your config is somewhere
                        unsafe like /tmp/ (default: False)

certonly:
  Options for modifying how a cert is obtained

  --csr CSR             Path to a Certificate Signing Request (CSR) in DER
                        format; note that the .csr file *must* contain a
                        Subject Alternative Name field for each domain you
                        want certified. (default: None)

install:
  Options for modifying how a cert is deployed

revoke:
  Options for revocation of certs

rollback:
  Options for reverting config changes

  --checkpoints N       Revert configuration N number of checkpoints.
                        (default: 1)

plugins:
  Plugin options

  --init                Initialize plugins. (default: False)
  --prepare             Initialize and prepare plugins. (default: False)
  --authenticators      Limit to authenticator plugins only. (default: None)
  --installers          Limit to installer plugins only. (default: None)

paths:
  Arguments changing execution paths & servers

  --cert-path CERT_PATH
                        Path to where cert is saved (with auth --csr),
                        installed from or revoked. (default: None)
  --key-path KEY_PATH   Path to private key for cert installation or
                        revocation (if account key is missing) (default: None)
  --fullchain-path FULLCHAIN_PATH
                        Accompanying path to a full certificate chain (cert
                        plus chain). (default: None)
  --chain-path CHAIN_PATH
                        Accompanying path to a certificate chain. (default:
                        None)
  --config-dir CONFIG_DIR
                        Configuration directory. (default: /etc/letsencrypt)
  --work-dir WORK_DIR   Working directory. (default: /var/lib/letsencrypt)
  --logs-dir LOGS_DIR   Logs directory. (default: /var/log/letsencrypt)
  --server SERVER       ACME Directory Resource URI. (default: https://acme-
                        staging.api.letsencrypt.org/directory)

plugins:
  Let's Encrypt client supports an extensible plugins architecture. See
  'letsencrypt plugins' for a list of all available plugins and their names.
  You can force a particular plugin by setting options provided below.
  Further down this help message you will find plugin-specific options
  (prefixed by --{plugin_name}).

  -a AUTHENTICATOR, --authenticator AUTHENTICATOR
                        Authenticator plugin name. (default: None)
  -i INSTALLER, --installer INSTALLER
                        Installer plugin name (also used to find domains).
                        (default: None)
  --configurator CONFIGURATOR
                        Name of the plugin that is both an authenticator and
                        an installer. Should not be used together with
                        --authenticator or --installer. (default: None)
  --apache              Obtain and install certs using Apache (default: False)
  --nginx               Obtain and install certs using Nginx (default: False)
  --standalone          Obtain certs using a "standalone" webserver. (default:
                        False)
  --manual              Provide laborious manual instructions for obtaining a
                        cert (default: False)
  --webroot             Obtain certs by placing files in a webroot directory.
                        (default: False)

nginx:
  Nginx Web Server - currently doesn't work

  --nginx-server-root NGINX_SERVER_ROOT
                        Nginx server root directory. (default: /etc/nginx)
  --nginx-ctl NGINX_CTL
                        Path to the 'nginx' binary, used for 'configtest' and
                        retrieving nginx version number. (default: nginx)

standalone:
  Automatically use a temporary webserver

  --standalone-supported-challenges STANDALONE_SUPPORTED_CHALLENGES
                        Supported challenges, order preferences are randomly
                        chosen. (default: http-01,tls-sni-01)

manual:
  Manually configure an HTTP server

  --manual-test-mode    Test mode. Executes the manual command in subprocess.
                        (default: False)

webroot:
  Webroot Authenticator

  --webroot-path WEBROOT_PATH
                        public_html / webroot path (default: None)

apache:
  Apache Web Server - Alpha

  --apache-ctl APACHE_CTL
                        Path to the 'apache2ctl' binary, used for
                        'configtest', retrieving the Apache2 version number,
                        and initialization parameters. (default: apache2ctl)
  --apache-enmod APACHE_ENMOD
                        Path to the Apache 'a2enmod' binary. (default:
                        a2enmod)
  --apache-dismod APACHE_DISMOD
                        Path to the Apache 'a2enmod' binary. (default:
                        a2dismod)
  --apache-init-script APACHE_INIT_SCRIPT
                        Path to the Apache init script (used for server
                        reload/restart). (default: /etc/init.d/apache2)
  --apache-le-vhost-ext APACHE_LE_VHOST_EXT
                        SSL vhost configuration extension. (default: -le-
                        ssl.conf)
  --apache-server-root APACHE_SERVER_ROOT
                        Apache server root directory. (default: /etc/apache2)
                        
```