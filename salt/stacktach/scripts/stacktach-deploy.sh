#! /bin/bash

apt-get install stacktach -y

cd /opt/stacktach
source etc/stacktach_config.sh

# Sync stacktach database
python manage.py syncdb --noinput
python manage.py migrate --noinput

# Start the web server and worker
python worker/start_worker.py &

mkdir -p /var/log/stacktach
chown horizon:horizon /var/log/stacktach -R
ln -s /etc/apache2/conf-available/stacktach.conf /etc/apache2/conf-enabled/
service apache2 restart
