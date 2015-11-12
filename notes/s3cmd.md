# s3cmd notes

installing the product

```
wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz
```
untar with `tar -zxvf s3cmd-1.6.0.tar.gz` and execute `python setup.py install` 

Generated a configuration file with the `s3cmd --install` command

The file generated is located at `/root/.s3cfg`

To check whether all is ok (and to list buckets on S3) : `s3cmd ls`


ansible-vault encrypt S3backup_keys.yml
docker build -t docker-s3cmd:latest ./docker-s3cmd/

WARNING: ssh/ssh_host_key.pub: Owner username not known. Storing UID=1000 instead.
WARNING: ssh/ssh_host_key.pub: Owner groupname not known. Storing GID=1000 instead.

[root@ns360684 jmm]# ll /var/gogs/ssh/ssh_host_rsa_key.pub 
-rw------- 1 jmm jmm 399 Oct 24 22:49 /var/gogs/ssh/ssh_host_rsa_key.pub

