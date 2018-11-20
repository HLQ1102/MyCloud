FROM centos:latest
RUN rm -rf /etc/yum.repos.d/*.repo
ADD local.repo /etc/yum.repos.d/local.repo
RUN yum install -y vim net-tools psmisc iproute && yum clean all
