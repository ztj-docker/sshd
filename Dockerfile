FROM ubuntu:18.04

LABEL maintainer="Ztj <ztj1993@gmail.com>"

RUN apt-get -y update \
  && apt-get install -y openssh-server \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir /run/sshd \
  && chmod 0755 /run/sshd \
  && sed -i "s@^#PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PermitRootLogin.*@PermitRootLogin yes@" /etc/ssh/sshd_config \
  && sed -i "s@^PasswordAuthentication.*@PasswordAuthentication yes@" /etc/ssh/sshd_config \
  && sed -i "s@^AllowTcpForwarding.*@AllowTcpForwarding yes@" /etc/ssh/sshd_config \
  && sed -i "s@^GatewayPorts.*@GatewayPorts yes@" /etc/ssh/sshd_config \
  && echo "root:123456" | chpasswd

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D", "-e"]
