#!/bin/bash
imgdir='/var/lib/libvirt/images/'
xmldir='/etc/libvirt/qemu/'
#准备后端盘
qemu-img create -b $imgdir/node.qcow2 -f qcow2 ${imgdir}/${1}.img 16G
#准备xml文件
sed "s,node,$1," ${xmldir}/node > ${xmldir}/${1}.xml
#定义虚拟机
virsh define ${xmldir}/${1}.xml
#启动虚拟机
#virsh start $1



for i in {0..5}
do
qemu-img create -b ${imgdir}node.qcow2 -f qcow2 ${imgdir}web${i}.img 10G
done

for i in {0..5}
do sed "s,node,web${i}," ${xmldir}node > web${i}.xml
done

for i in {0..5}
do virsh define ${xmldir}web${i}.xml
done

