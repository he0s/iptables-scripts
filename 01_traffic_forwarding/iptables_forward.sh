#!/bin/bash

INP_IFACE="enp0s8"
OUT_IFACE="enp0s3"

echo "Applying rules"
iptables -A FORWARD -i "${INP_IFACE}" -j ACCEPT
iptables -A FORWARD -o "${OUT_IFACE}" -j ACCEPT
iptables -t nat -A POSTROUTING -o "${OUT_IFACE}" -j MASQUERADE
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
