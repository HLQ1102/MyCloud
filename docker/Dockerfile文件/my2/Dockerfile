FROM myos:abc
RUN yum install -y openssh-server initscripts 
RUN echo 'aa' | passwd --stdin root
ENV EnvironmentFile=/etc/sysconfig/sshd
RUN sshd-keygen
CMD ["/usr/sbin/sshd","-D"]
