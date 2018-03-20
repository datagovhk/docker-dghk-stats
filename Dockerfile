FROM datagovhk/centos:latest

RUN yum -y groupinstall development
RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN yum -y install openssh-server passwd java-1.8.0-openjdk-devel yum-utils which cronie python36u python36u-pip python36u-devel
RUN yum clean all
RUN pip3.6 install --upgrade pip
RUN pip3.6 install boto3 requests

RUN mkdir -p /var/run/sshd /usr/local/bin
ADD entry.sh /usr/local/bin
RUN chmod a+rx /usr/local/bin/entry.sh

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''

CMD ["/usr/local/bin/entry.sh"]
