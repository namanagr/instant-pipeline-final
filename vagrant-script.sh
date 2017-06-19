#/bin/bash

touch /home/vagrant/.bash_profile
echo 'alias docker="sudo docker"' > /home/vagrant/.bash_profile
echo 'alias docker-compose="sudo docker-compose"' >> /home/vagrant/.bash_profile

sudo mkdir -p /var/log/gogs
sudo chown vagrant /var/log/gogs
sudo chgrp vagrant /var/log/gogs

sudo cp /home/vagrant/instant-pipeline/gogs/scripts/supervisor/gogs /etc/supervisor/conf.d/gogs.conf
sudo service supervisor restart 

