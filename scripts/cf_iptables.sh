#!/bin/bash
##
#
# cf_iptables
# ===========
#
# Simple iptables script for cloudflare
# 
# Sets iptables rules to only allow cloudflare IP ranges
# This stops direct traffic from visitors / hackers & means every visitor is
# connecting via cloudflare.
#
##
# equk 2014 - equk.co.uk
##

# check if root (required for iptables)
if [ $(whoami) != "root" ]; then
    echo "ERROR: Please Run As Root User (required for iptables)"
    exit 1
fi

# cloudflare ipv4
for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -p tcp -s $i --dport http -j ACCEPT; done
for i in `curl https://www.cloudflare.com/ips-v4`; do iptables -I INPUT -p tcp -s $i --dport https -j ACCEPT; done

# cloudflare ipv6
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -p tcp -s $i --dport http -j ACCEPT; done
for i in `curl https://www.cloudflare.com/ips-v6`; do ip6tables -I INPUT -p tcp -s $i --dport https -j ACCEPT; done

# drop all others ipv4
iptables -A INPUT -p tcp --dport http -j DROP
iptables -A INPUT -p tcp --dport https -j DROP
# drop all others ipv6
ip6tables -A INPUT -p tcp --dport http -j DROP
ip6tables -A INPUT -p tcp --dport https -j DROP
