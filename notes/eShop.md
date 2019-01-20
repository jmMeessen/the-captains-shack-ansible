# Enabling ecommerce

## File system preparations
* Starting some tests with OpenCart (https://github.com/bitnami/bitnami-docker-opencart)
* create directoy `/home/data/openCart` (! ownership)
* Create directory `/home/data/openCart/db_data`
* Create directory `/home/data/openCart/openCart_data`

## Docker-compose
* Create `docker-compose. yml` in `/home/data/openCart`

```yml
version: '3'

services:
  fix-mariadb-permissions:
    image: 'bitnami/mariadb:latest'
    user: root
    command: chown -R 1001:1001 /bitnami
    volumes:
      - '/home/data/openCart/db_data:/bitnami'

  mariadb:
    image: 'bitnami/mariadb:latest'
    environment:
      - ALLOW_EMPTY_PASSWORD=yes
      - MARIADB_USER=bn_opencart
      - MARIADB_DATABASE=bitnami_opencart
    depends_on:
      - fix-mariadb-permissions
    volumes:
      - '/home/data/openCart/db_data:/bitnami'

  opencart:
    image: 'bitnami/opencart:latest'
    environment:
      - OPENCART_HOST=bimbobulles.the-captains-shack.com
      - OPENCART_DATABASE_USER=bn_opencart
      - OPENCART_DATABASE_NAME=bitnami_opencart
      - ALLOW_EMPTY_PASSWORD=yes
    depends_on:
      - mariadb
    #ports:
    #  - ':80'
    volumes:
      - '/home/data/openCart/openCart_data:/bitnami'

networks:
  default:
    external:
      name: docker_default
```

## Setup domain in DBS
(one time operation). `bimbobulles IN CNAME the-captains-shack.com.`

## Create redirection in NGINX and request certificate
* In directory `/home/data/nginx/conf/sites-enabled`, copy the `gogs_proxy.conf`to `bimbobulles_proxy.conf`
* modify the conf for bibmbobulles sub-domain
* modify `/home/data/docker/request_certificates.sh` to request certificate for bimbobulles sub-domain

## Setup the site in NGINX
* Create `bimbobulles_proxy.conf` in the `/home/data/nginx/conf/sites-enabled` directory following this model. The settings of the proxy_header is critical for the good processing of the requests.

```
server {
  listen 80;
  server_name bimbobulles.the-captains-shack.com;
  return 301 https://$host$request_uri;
}

server {
    listen 443;
    server_tokens off;
    server_name bimbobulles.the-captains-shack.com;

    ssl_certificate         ssl/bimbobulles.the-captains-shack.com/fullchain.pem;
    ssl_certificate_key     ssl/bimbobulles.the-captains-shack.com/privkey.pem;
    ssl_trusted_certificate ssl/bimbobulles.the-captains-shack.com/fullchain.pem;

    ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers on;
    ssl_ciphers "EECDH+ECDSA+AESGCM EECDH+aRSA+AESGCM EECDH+ECDSA+SHA384 EECDH+ECDSA+SHA256 EECDH+aRSA+SHA384 EECDH+aRSA+SHA256 EECDH+aRSA+RC4 EECDH EDH+aRSA RC4 !aNULL !eNULL !LOW !3DES !MD5 !EXP !PSK !SRP !DSS !RC4";

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        #proxy_set_header X-Forwarded-For $remote_addr;

        proxy_set_header        Accept-Encoding   "";
        proxy_set_header        Host            $host;
        #proxy_set_header        X-Real-IP       $remote_addr;
        proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;

        ### Most PHP, Python, Rails, Java App can use this header ###
        #proxy_set_header X-Forwarded-Proto https;##
        #This is better##
        proxy_set_header        X-Forwarded-Proto $scheme;
        add_header              Front-End-Https   on;

        proxy_pass http://opencart:80;
    }

    client_max_body_size 200m;

    error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 /500.html;
    location = /500.html {
        root   /usr/share/nginx/html;
    }

    error_page   501  /501.html;
    location = /501.html {
        root   /usr/share/nginx/html;
    }

    error_page   502  /502.html;
    location = /502.html {
        root   /usr/share/nginx/html;
    }

    error_page   503  /503.html;
       location = /503.html {
       root   /usr/share/nginx/html;
    }

    error_page   504  /504.html;
    location = /504.html {
        root   /usr/share/nginx/html;
    }

}
```


Random notes: 
* https://forums.docker.com/t/proxy-between-docker-network-and-internet/33120
* https://devops.stackexchange.com/questions/4514/internal-network-between-container-docker-compose-with-outgoing-connection

docker network create --internal --driver=bridge back
docker network create --driver=bridge internet

https://github.com/bitnami/bitnami-docker-matomo/issues/18