FROM ubuntu:14.04

# Update Ubuntu and install common packages
RUN apt-get update -y
#RUN apt-get install -y s3cmd
RUN apt-get install -y wget
RUN wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.6.0/s3cmd-1.6.0.tar.gz
RUN tar -zxvf s3cmd-1.6.0.tar.gz
RUN apt-get install -y python-setuptools
#RUN cd /s3cmd-1.6.0
RUN cd /s3cmd-1.6.0 && python setup.py install

ADD files/s3cfg /.s3cfg
ADD files/main.sh /main.sh

# Main entrypoint script
RUN chmod 777 main.sh

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

WORKDIR /
CMD ["/main.sh"]
