#!/bin/bash
imgdir='/var/lib/libvirt/images/'
xmldir='/etc/libvirt/qemu'
#准备ansible主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/ansible.img 16G
#准备xml文件
sed "s,node,$1," ${xmldir}/node > ${xmldir}/ansible.xml
#定义虚拟机
virsh define ${xmldir}/ansible.xml

#准备cache主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/cache.img 16G
sed "s,node,$1," ${xmldir}/node > ${xmldir}/cache.xml
virsh define ${xmldir}/cache.xml

#准备db1主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/db1.img 16G
sed "s,node,$1," ${xmldir}/node > ${xmldir}/db1.xml
virsh define ${xmldir}/db1.xml

#准备db2主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/db2.img 16G
sed "s,node,$1," ${xmldir}/node > ${xmldir}/db2.xml
virsh define ${xmldir}/db2.xml

#准备web1主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/web1.img 16G
sed "s,node,$1," ${xmldir}/node > ${xmldir}/web1.xml
virsh define ${xmldir}/web1.xml

#准备web2主机
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/web2.img 16G
sed "s,node,$1," ${xmldir}/node > ${xmldir}/web2.xml
virsh define ${xmldir}/web2.xml


createrepo --update .
