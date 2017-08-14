FROM centos:7

WORKDIR /opt/lounge
EXPOSE 9000

RUN yum -y install gcc-c++ make
RUN curl -sL https://rpm.nodesource.com/setup_6.x | bash -
RUN yum -y install nodejs git
RUN git clone https://github.com/thelounge/lounge
WORKDIR /opt/lounge/lounge
RUN npm install -g thelounge

ADD start.sh /usr/local/bin
RUN chgrp -R 0 /opt/lounge && chmod -R g=u /opt/lounge /etc/passwd
USER 10001
WORKDIR /opt/lounge/lounge
ADD uid-entrypoint.sh /usr/local/bin
ENTRYPOINT /usr/local/bin/uid-entrypoint.sh

CMD /usr/local/bin/start.sh
