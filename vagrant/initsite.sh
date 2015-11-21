#!/usr/bin/env bash

block="
<VirtualHost *:80>
    ServerName $1
    ServerAlias www.$1 

    ServerAdmin webmaster@localhost
    DocumentRoot $2

	ErrorLog /var/log/apache2/error.log
    CustomLog /var/log/apache2/access.log combined

    <Directory "/var/www/$1">
         Options Indexes FollowSymLinks MultiViews
         AllowOverride All
         Order deny,allow
         Allow from all
         Require all granted
    </Directory> 
</VirtualHost>
"

echo "$block" > "/etc/apache2/sites-available/$1.conf"
ln -fs "/etc/apache2/sites-available/$1.conf" "/etc/apache2/sites-enabled/$1.conf"

sudo service apache2 restart