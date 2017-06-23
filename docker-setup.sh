#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get -y update
apt-get -y install jenkins
apt-get -y install docker.io

# Install and setup sqlite database
apt-get -y install sqlite3 libsqlite3-dev

cp -R /home/vagrant/instant-pipeline/jenkins /var/lib/
chown -R jenkins /var/lib/jenkins
chgrp -R jenkins /var/lib/jenkins
service jenkins restart

sh -c 'echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
apt-get -y install supervisor
