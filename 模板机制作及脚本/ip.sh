#!/bin/bash
read -p "input ip address(one):" a
echo " 
DEVICE=\"eth0\"
ONBOOT=\"yes\"
NM_CONTROLLED=\"no\"
TYPE=\"Ethernet\"
BOOTPROTO=\"static\"
IPADDR=\"192.168.1.$a\"
NETMASK=\"255.255.255.0\"
"  > /etc/sysconfig/network-scripts/ifcfg-eth0
ifdown eth0
ifup eth0

