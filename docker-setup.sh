#!/bin/bash
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
sudo apt-get -y update
sudo apt-get -y install jenkins
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get -y update
sudo apt-get -y install docker-ce

# Install and setup sqlite database
sudo apt-get -y install sqlite3 libsqlite3-dev

sudo cp -R /home/vagrant/instant-pipeline/jenkins /var/lib/
sudo chown -R jenkins /var/lib/jenkins
sudo chgrp -R jenkins /var/lib/jenkins
sudo service jenkins restart

sudo sh -c 'echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers'
sudo apt-get -y install supervisor
