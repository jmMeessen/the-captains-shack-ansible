FROM ubuntu:14.04

# Update Ubuntu and install common packages
RUN apt-get update -y && apt-get install -y wget python-setuptools
RUN wget http://sourceforge.net/projects/s3tools/files/s3cmd/1.6.1/s3cmd-1.6.1.tar.gz && \
    tar -zxvf s3cmd-1.6.1.tar.gz && \
    cd /s3cmd-1.6.1 && \
    python setup.py install && \
    rm /s3cmd-1.6.1.tar.gz

ADD files/s3cfg /.s3cfg
ADD files/main.sh /main.sh

# Main entrypoint script
RUN chmod 777 main.sh

# Folders for s3cmd optionations
RUN mkdir /opt/src
RUN mkdir /opt/dest

WORKDIR /
CMD ["/main.sh"]
