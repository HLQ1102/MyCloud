#!/bin/bash
ansible mysql -m yum -a  'name=httpd state=installed'
ansible mysql -m lineinfile -a 'path=/etc/httpd/conf.d/welcome.conf regexp="^L.*(80)$" line="Listen 8080"'
ansible mysql -m copy -a 'src=./index.html dest=/var/www/html/index.html'
ansible mysql -m lineinfile -a 'path=/etc/httpd/conf/httpd.conf regexp="^(#ServerName).*(80)$" line="ServerName www.example.com:80"'
ansible mysql -m shell -a 'apachectl -t'
ansible mysql -m service -a 'name=httpd enabled=yes state=started'

