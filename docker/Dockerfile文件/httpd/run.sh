#!/bin/bash
/usr/sbin/sshd -D &
/usr/sbin/httpd -DFOREGROUND
