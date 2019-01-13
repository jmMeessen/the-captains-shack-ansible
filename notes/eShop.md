# Enabling ecommerce

* Starting some tests with OpenCart (https://github.com/bitnami/bitnami-docker-opencart)
* create directoy `/home/data/openCart` (! ownership)
* Create directory `/home/data/openCart/db_data`
* Create directory `/home/data/openCart/openCart_data`

* Create docker-compose. yml

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
