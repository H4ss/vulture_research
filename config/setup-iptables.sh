#!/bin/bash

# Enable verbose output for debugging
set -x

echo "Setting up iptables rules..."

# Allow outbound traffic to the subnet
iptables -A OUTPUT -d 172.24.0.0/16 -j ACCEPT
echo "Allowed outbound traffic within the 172.19.0.0/16 subnet."

# Block all other outbound traffic
iptables -A OUTPUT -j DROP
echo "Blocked all other outbound traffic."

# Ensure the loopback interface is not affected
iptables -I OUTPUT 1 -o lo -j ACCEPT
echo "Allowed traffic on the loopback interface."

# Allow established connections to continue
iptables -I OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
echo "Allowed established connections."

echo "iptables setup complete."
