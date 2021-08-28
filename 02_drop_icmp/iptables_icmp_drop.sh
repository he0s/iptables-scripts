#!/bin/bash
set -xe

echo "Applying rules"
iptables -A INPUT -p icmp -j DROP
iptables -A OUTPUT -p icmp -j DROP
iptables -A INPUT -p tcp -m tcp -m multiport ! --dports 22 -j DROP
iptables -A FORWARD -p icmp -j DROP
