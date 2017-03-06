FROM greghellings/sword:latest

WORKDIR /root

ADD install.sh /root/install.sh

RUN /bin/bash install.sh
