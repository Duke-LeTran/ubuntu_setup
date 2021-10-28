# installation
Installing a webserver on Ubuntu is a lot easier than you think...
```
sudo apt upgrade -y; sudo apt-get upgrade
sudo apt install apache2
sudo apt install php libapache2-mod-php
sudo systemctl restart apache2 # restart after php installed
```


# How to configure Apache

## apache2 websites
`/var/www/all_your_websites_go_here`

## apache2 config

`/etc/apache2`

```
apache2.conf  envvars     magic            mods-enabled/  sites-available/
conf.d/       httpd.conf  mods-available/  ports.conf     sites-enabled/
```


* `apache2.conf`: This is the main configuration file for the server. Almost all configuration can be done from within this file, although it is recommended to use separate, designated files for simplicity. This file will configure defaults and be the central point of access for the server to read configuration details.
* `ports.conf`: This file is used to specify the ports that virtual hosts should listen on. Be sure to check that this file is correct if you are configuring SSL.
* `conf.d/`: This directory is used for controlling specific aspects of the Apache configuration. For example, it is often used to define SSL configuration and default security choices.
* `sites-available/`: This directory contains all of the virtual host files that define different web sites. These will establish which content gets served for which requests. These are available configurations, not active configurations.
* `sites-enabled/`: This directory establishes which virtual host definitions are actually being used. Usually, this directory consists of symbolic links to files defined in the "sites-available" directory.
* `mods-[enabled,available]/`: These directories are similar in function to the sites directories, but they define modules that can be optionally loaded instead.

# Links
* https://www.digitalocean.com/community/tutorials/how-to-configure-the-apache-web-server-on-an-ubuntu-or-debian-vps
* https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04


# PHP 7.4
## After upgrading

1. `sudo a2dismod php7.2` it will disable 7.2 version for apache 
2. Then `sudo a2enmod php7.4` it will enable 7.4 for apache
3. Then `sudo service apache restart` to restart apache

## Upgrading, follow guides below
* 18.04 - https://www.digitalocean.com/community/tutorials/how-to-install-php-7-4-and-set-up-a-local-development-environment-on-ubuntu-18-04
* 20.04 - https://linuxize.com/post/how-to-install-php-on-ubuntu-20-04/#installing-php-74-with-apache
* https://stackoverflow.com/questions/60539767/php-version-showing-7-2-version-in-phpinfo-php-file-instead-of-php-7-4