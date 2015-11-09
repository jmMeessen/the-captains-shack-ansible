# s3cmd notes

installing the product

```
wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz
```
untar with `tar -zxvf s3cmd-1.6.0.tar.gz` and execute `python setup.py install` 

Generated a configuration file with the `s3cmd --install` command

The file generated is located at `/root/.s3cfg`

To check whether all is ok (and to list buckets on S3) : `s3cmd ls`


```
FROM ubuntu:14.04

# Update Ubuntu and install common packages
RUN apt-get update -y
#RUN apt-get install -y s3cmd
RUN apt-get install -y wget
RUN wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz
RUN tar -zxvf s3cmd-1.6.0.tar.gz
RUN cd s3cmd-1.6.0
RUN apt-get install -y python-setuptools
RUN python setup.py install

ADD files/s3cfg /.s3cfg
ADD files/main.sh /main.sh

# Main entrypoint script
RUN chmod 777 main.sh

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

WORKDIR /
CMD ["/main.sh"]

```
ansible-vault encrypt S3backup_keys.yml
docker build -t docker-s3cmd:latest ./docker-s3cmd/


