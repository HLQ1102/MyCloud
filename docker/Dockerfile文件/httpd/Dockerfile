FROM myos:sshd
RUN yum -y install httpd
RUN echo 'hello world' > /var/www/html/index.html
ENV EnvironmentFile=/etc/sysconfig/httpd
EXPOSE 80
EXPOSE 443
add run.sh /etc/rc.d/init.d/run.sh
CMD ["/etc/rc.d/init.d/run.sh"]
