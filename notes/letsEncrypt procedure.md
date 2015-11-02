# Let' encrypt certificate procedure

execute the certificate request docker container from the server it self after having cut the servers 
listening on 80 and 443 with a "docker-compose stop"

```
sudo docker run -it --rm -p 443:443 -p 80:80 --name letsencrypt \
            -v "/etc/letsencrypt:/etc/letsencrypt" \
            -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
            quay.io/letsencrypt/letsencrypt:latest auth
```

The certificates are generated in `/var/letsencrypt/live/<serverName>/`  

copy the generated certificates

```
cp -R -L -v /etc/letsencrypt/live/* .
```
