# Dockerfile for reprepro
# Version 0.0.1
FROM debian:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

RUN apt-get update && apt-get upgrade -y; \
	apt-get install -y openvpn openvpn-auth-ldap strace;

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD /bin/bash