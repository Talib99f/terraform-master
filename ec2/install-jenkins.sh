#!/bin/bash
set -euxo pipefail

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y fontconfig openjdk-21-jre wget python3 python3-pip python-is-python3 git docker.io

install -d -m 0755 /etc/apt/keyrings
wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

apt-get update
apt-get install -y jenkins

systemctl enable --now docker
usermod -aG docker jenkins
systemctl enable jenkins
systemctl restart jenkins
