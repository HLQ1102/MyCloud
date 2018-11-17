#!/bin/bash
imgdir='/var/lib/libvirt/images/'
xmldir='/etc/libvirt/qemu'
#准备后端盘
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/${1}.img 20G
#准备xml文件
sed "s,node,$1," ${xmldir}/node > ${xmldir}/${1}.xml
#定义虚拟机
virsh define ${xmldir}/${1}.xml
#启动虚拟机
virsh start $1
