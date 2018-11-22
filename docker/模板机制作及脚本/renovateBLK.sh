#!/bin/bash
LANG=en_CN.UTF-8
/usr/bin/growpart  /dev/vda 1
/usr/sbin/xfs_growfs /

