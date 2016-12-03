#!/bin/bash

mkdir -p ~/bin
touch .bash_profile_local

sudo apt-get update

# Git

sudo apt-get -y install git

# My dotfiles

cd ~ && \
git clone https://github.com/buckeram/dotfiles.git && \
chmod +x ./dotfiles/makesymlinks.sh && \
./dotfiles/makesymlinks.sh

# Vim + Vundle (start vim and run :BundleInstall)

sudo apt-get -y install vim-gnome && \
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Emacs (Spacemacs)

sudo apt-get -y install emacs && \
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# Oracle JDK 8

sudo add-apt-repository ppa:webupd8team/java && \
sudo apt-get update && \
sudo apt-get -y install oracle-java8-installer && \
sudo apt-get -y install oracle-java8-set-default

# Maven (consider just downloading the tar.gz)

sudo apt-get -y install maven

# Scala and Apache Spark
# Spark 2.0.2 needs Scala 2.11.x
# With IntelliJ: https://www.supergloo.com/fieldnotes/intellij-scala-spark/

mkdir -p ~/opt && cd ~/opt && \
    wget http://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz && \
    tar xf scala-2.11.8.tgz && \
    ln -s scala-2.11.8 scala && \
    rm -f scala-2.11.8.tgz && \
    export PATH="$PATH:$HOME/opt/scala/bin" && \
    echo PATH="$PATH:$HOME/opt/scala/bin" >> ~/.bash_profile_local

cd ~/opt && wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.2-bin-hadoop2.7.tgz && \
    tar xf spark-2.0.2-bin-hadoop2.7.tgz && \
    ln -s spark-2.0.2-bin-hadoop2.7 spark && \
    export PATH="$PATH:$HOME/opt/spark/bin" && \
    echo PATH="$PATH:$HOME/opt/spark/bin" >> ~/.bash_profile_local && \
    rm -f spark-2.0.2-bin*.tgz

# SBT

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list && \
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
sudo apt-get update && \
sudo apt-get -y install sbt

# Typesafe Activator (minimal for now)

cd ~/opt && \
wget https://downloads.typesafe.com/typesafe-activator/1.3.12/typesafe-activator-1.3.12-minimal.zip && \
unzip typesafe-activator-1.3.12-minimal.zip && \
mv activator-1.3.12-minimal activator && \
rm -f typesafe-activator*.zip && \
cd ~/bin && ln -s ~/opt/activator/bin/activator

# Anaconda (Python 3)

wget https://repo.continuum.io/archive/Anaconda3-4.2.0-Linux-x86_64.sh -O ~/anaconda.sh && \
    bash ~/anaconda.sh -b -p $HOME/opt/anaconda && \
    export PATH="$HOME/opt/anaconda/bin:$PATH" && \
    echo PATH="$HOME/opt/anaconda/bin:$PATH" >> ~/.bash_profile_local && \
    rm -f ~/anaconda.sh

# IntelliJ IDEA (still need to enter license manually)

cd ~/opt && \
    wget https://download.jetbrains.com/idea/ideaIU-2016.3-no-jdk.tar.gz && \
    tar xfz ideaIU-*.tar.gz && \
    rm -f ideaIU-*.tar.gz && \
    cd ~/bin && \
    ln -s ~/opt/idea*/bin/idea.sh

# Dropbox (Need to finish installation manually)

wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb -O dropbox.deb && \
    sudo dpkg -i dropbox.deb && \
    sudo apt-get install -f -y && \
    rm -f dropbox.deb

# Google Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    sudo dpkg -i google-chrome-stable_current_amd64.deb && \
    sudo apt-get install -f -y && \
    rm -f google-chrome-stable_current_amd64.deb
 
# VS Code

wget https://go.microsoft.com/fwlink/?LinkID=760868 -O vscode.deb && \
    sudo dpkg -i vscode.deb && \
    sudo apt-get install -f && \
    rm -f vscode.deb

# Tomcat (TODO - set up admin user in tomcat-users.xml)

cd ~/opt && mkdir -p tomcat && \
    wget http://ftp.heanet.ie/mirrors/www.apache.org/dist/tomcat/tomcat-8/v8.0.39/bin/apache-tomcat-8.0.39.tar.gz && \
    tar xzf apache-tomcat-8*tar.gz -C ~/opt/tomcat --strip-components=1 && \
    rm -f apache-tomcat*.gz

# MySQL - some manual steps (TODO - see if manual step [setting root password] can be automated)

sudo apt-get -y install mysql-server && \
    /usr/bin/mysql_secure_installation

# Docker, and add self to the 'docker' group to avoid having to invoke docker with sudo

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D &&\
    sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' && \
    sudo apt-get update && \
    sudo apt-get install -y docker-engine && \
    sudo usermod -aG docker $(whoami)

curl -L https://github.com/docker/compose/releases/download/1.9.0/docker-compose-`uname -s`-`uname -m` > ~/bin/docker-compose && \
chmod +x ~/bin/docker-compose

# hugo

sudo apt-get install -y hugo

## TODO ##
# Kubernetes
# Go lang
# Brave browser
# Cassandra
# MongoDB

