FROM tianon/centos:6.5
MAINTAINER akram.benaissi@gmail.com

RUN yum install -y squid

# If you are prone to gouging your eyes out, do not read the following 2 lines
RUN sed -i 's@#\tauth_param basic program /usr/lib/squid/basic_ncsa_auth /usr/etc/passwd@auth_param basic program /usr/lib/squid/basic_ncsa_auth /usr/etc/passwd\nacl ncsa_users proxy_auth REQUIRED@' /etc/squid/squid.conf
RUN sed -i 's@^http_access allow localhost$@\0\nhttp_access allow ncsa_users@' /etc/squid/squid.conf
RUN mkdir -p /usr/etc

EXPOSE 3128

ADD init /init
CMD ["/init"]
