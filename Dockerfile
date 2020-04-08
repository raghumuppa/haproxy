FROM ubuntu

#Installing Package
RUN apt-get update \
    && apt-get install -qy haproxy

#Ading missing socket patch
RUN mkdir /run/haproxy

#Copying conf file
COPY haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE 80

CMD ["/usr/sbin/haproxy","-W","-db","-f","/etc/haproxy/haproxy.cfg"]
