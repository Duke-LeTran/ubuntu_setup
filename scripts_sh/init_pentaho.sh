#!/bin/sh
# This is the setup file for a pentaho service account on a linux server
# Assumptions
# This assumes you have 
# 1. git setup
# 2. your ssh keys added
# 3. Pentaho, Java, and db drivers downloaded (unziped) to ~/Downloads
# Future versions will auto-download files to ~/Downloads

#####################################################
# I. Setup local directories
#####################################################
# mkdir ~/Downloads
mkdir ~/.local
mkdir ~/.local/bin
mkdir ~/.local/opt # install pentaho here
mkdir ~/.local/java

#####################################################
# II. Dowload
#####################################################
## Alternatively, you can download an send over via winscp
## A. Pentaho
if [ -f $HOME/Downloads/pdi-ce-*.zip ]; then
    echo "Pentaho already downloaded, check."
else # note, this link may break
    echo "Downloading Pentaho..."
    curl https://newcontinuum.dl.sourceforge.net/project/pentaho/Pentaho-9.2/client-tools/pdi-ce-9.2.0.0-290.zip --output ~/Downloads/pdi-ce-9.2.0.0-290.zip
fi
## B. Download etl-common
## Note this is self-referential, ideal if init_pentaho.sh is used first 
if [ -d $HOME/.local/opt/etl-common ]; then
    echo "etl-common already cloned, checked."
else
    git clone git@github.com:ucdavis/etl-common.git ~/.local/opt
fi
## C. Java
## TO-DO: Download Java
## D. MariaDB Oracle Drivers
## TO-DO: Download drivers
# Link etl-common to folder
ln -s "$HOME/.local/opt/etl-common/etl-template.sh" "$HOME/.local/bin/etl-template.sh"

######################################################
# III. Setup environment variables
######################################################
echo '' >> ~/.bashrc
echo '# Pentaho Environmental Variables' >> ~/.bashrc
echo '# ------------------------------------' >> ~/.bashrc
echo 'export JAVA_HOME="$HOME/.local/java/jdk1.8.0_271"' >> ~/.bashrc
echo 'export PENTAHO_HOME="$HOME/.local/opt/data-integration"' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PENTAHO_HOME:$JAVA_HOME/bin:$PATH"' >> ~/.bashrc
echo '' >> ~/.bashrc
tail ~/.bashrc
echo 'Done installing your pentaho environmental variables'

######################################################
# IV. Setup apps
######################################################
# you just download Pentaho, Java, and the drivers and place them in ~/Downloads
## A. Pentaho
FILE=$HOME/Downloads/pdi-ce-*.zip
if [ -f $FILE ]; then
    unzip $FILE -d $HOME/.local/opt
    ln -s $HOME/.local/opt/data-integration $HOME/pentaho
    echo ''
fi

## B. Java
FILE=$HOME/Downloads/jdk-8u271-linux-x64.tar.gz
if [ -f $FILE ]; then
    tar -xzvf $FILE -C $HOME/.local/java 
    echo ''
fi

## C. Oracle and MariaDb Drivers (Pentaho)
FILE="$HOME/Downloads/oracle and mariadb jdbc drivers for petaho.zip"
echo "$FILE"
if [ -f "$FILE" ]; then
    unzip "$FILE" -d $HOME/.local/opt/data-integration/lib
fi

# 1. Download pdi-ce-9.X.X.X-YYY (pentaho)
# 2. Download java, specifically jdk1.8.0_271
# 3. Setup crontab
