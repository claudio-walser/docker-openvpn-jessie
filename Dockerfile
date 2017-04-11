# Dockerfile for reprepro
# Version 0.0.1
FROM debian:latest

MAINTAINER Claudio Walser <claudio.walser@srf.ch>

RUN apt-get update && apt-get upgrade -y; \
	apt-get install -y openvpn openvpn-auth-ldap iptables;

ENV OPENVPN /etc/openvpn
ENV EASYRSA /usr/share/easy-rsa
ENV EASYRSA_PKI $OPENVPN/pki
ENV EASYRSA_VARS_FILE $OPENVPN/vars

VOLUME ["/etc/openvpn"]

ADD ./bin /usr/local/bin
RUN chmod a+x /usr/local/bin/*

EXPOSE 1194/udp

CMD ovpn_run