#!/bin/bash
#read -p "input VM number:" VMNUM
cd /var/lib/libvirt/images/
#qemu-img create -b openstack.qcow2 -f qcow2 openstack.img 16G
sed "s#node#nova01#" /root/桌面/nsd1807/node.xml > /etc/libvirt/qemu/nova01.xml
virsh define /etc/libvirt/qemu/nova01.xml
#virsh start nova01$VMNUM
