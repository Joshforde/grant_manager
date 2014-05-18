#!/bin/sh

sudo apt-get update
sudo apt-get install -y couchdb nginx npm cpanminus libexpat1-dev

cd /etc/nginx/sites-enabled
sudo rm default
sudo ln -s /vagrant/etc/nginx .
sudo nginx restart
