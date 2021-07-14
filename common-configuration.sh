#/bin/sh

systemctl stop firewalld
systemctl disable firewalld

swapoff -a
