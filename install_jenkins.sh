#!/bin/bash

sudo amazon-linux-extras enable corretto8 -y

#only java17 version is compatible with the jenkins otherwise jenkins doesn't start
sudo sudo dnf install java-17-amazon-corretto -y

sudo java --version

sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum upgrade -y

sudo yum install jenkins -y

sudo systemctl enable jenkins

sudo systemctl start jenkins

sudo systemctl status jenkins

cat /var/lib/jenkins/secrets/initialAdminPassword