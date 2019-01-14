# Enabling ecommerce

## File system preparations
* Starting some tests with OpenCart (https://github.com/bitnami/bitnami-docker-opencart)
* create directoy `/home/data/openCart` (! ownership)
* Create directory `/home/data/openCart/db_data`
* Create directory `/home/data/openCart/openCart_data`

## Docker-compose
* Create `docker-compose. yml` in `/home/data/openCart`

```yml
version: '2'

services:
mariadb:
    image: 'bitnami/mariadb:latest'
    environment:
    - ALLOW_EMPTY_PASSWORD=yes
    - MARIADB_USER=bn_opencart
    - MARIADB_DATABASE=bitnami_opencart
    volumes:
    - '/home/data/openCart/db_data:/bitnami'
opencart:
    image: 'bitnami/opencart:latest'
    environment:
    - OPENCART_DATABASE_USER=bn_opencart
    - OPENCART_DATABASE_NAME=bitnami_opencart
    - ALLOW_EMPTY_PASSWORD=yes
    depends_on:
    - mariadb
    ports:
    - '80'
    - '443'
    volumes:
    - '/home/data/openCart/openCart_data:/bitnami'
```

## Setup domain in DBS
(one time operation). `bimbobulles IN CNAME the-captains-shack.com.`

## Create redirection in NGINX and request certificate
* In directory `/home/data/nginx/conf/sites-enabled`, copy the `gogs_proxy.conf`to `bimbobulles_proxy.conf`
* modify the conf for bibmbobulles sub-domain
* modify `/home/data/docker/request_certificates.sh` to request certificate for bimbobulles sub-domain


Random notes: 
* https://forums.docker.com/t/proxy-between-docker-network-and-internet/33120
* https://devops.stackexchange.com/questions/4514/internal-network-between-container-docker-compose-with-outgoing-connection