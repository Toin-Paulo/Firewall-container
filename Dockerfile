FROM debian:stable

RUN apt update && apt install -y iptables iproute2 iputils-ping curl net-tools

RUN echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf

COPY start-firewall.sh /start-firewall.sh
RUN chmod +x /start-firewall.sh

CMD ["/start-firewall.sh"]
