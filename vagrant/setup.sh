#!/bin/bash

# Updating repository
sudo apt-get update -y

# Installing Apache
sudo apt-get install apache2 -y

# Installing MySQL and it's dependencies, Also, setting up root password for MySQL as it will prompt to enter the password during installation
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password password $1"
sudo debconf-set-selections <<< "mysql-server-5.5 mysql-server/root_password_again password $1"

sudo apt-get install mysql-server -y
sudo apt-get install libapache2-mod-auth-mysql -y
sudo apt-get install php5-mysql -y

# Installing PHP and it's dependencies
sudo apt-get install curl -y
sudo apt-get install php5 -y
sudo apt-get install php5-curl -y
sudo apt-get install php5-gd -y
sudo apt-get install php5-mcrypt -y

#install imagemagick
sudo apt-get install -y imagemagick
sudo apt-get install -y php5-imagick

#install unzip
sudo apt-get install unzip -y

#install git
sudo apt-get install vim -y

#apache2: Could not determine the server's fully qualified domain name, using 127.0.0.1 for ServerName
sudo rm -f /etc/apache2/conf.d/fqdn

echo "ServerName localhost" | sudo tee /etc/apache2/conf.d/fqdn