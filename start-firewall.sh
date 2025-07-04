#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -s 172.28.0.3 -j ACCEPT

iptables -A FORWARD -s 172.28.0.3 -d 142.250.0.0/15 -j REJECT
iptables -A FORWARD -s 172.28.0.3 -d 142.251.0.0/16 -j REJECT
iptables -A FORWARD -m string --string "youtube.com" --algo bm -j REJECT

tail -f /dev/null
