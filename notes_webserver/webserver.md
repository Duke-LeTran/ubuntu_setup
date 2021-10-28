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
# Links
* https://www.digitalocean.com/community/tutorials/how-to-configure-the-apache-web-server-on-an-ubuntu-or-debian-vps
* https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-ubuntu-20-04
* https://linuxize.com/post/how-to-install-php-on-ubuntu-20-04/#installing-php-74-with-apache