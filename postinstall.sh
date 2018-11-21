#!/bin/sh

#######################################
## Before anything else, install git ##
#######################################
sudo apt install -y git

########################
## Create directories ##
########################

mkdir ~/workspace/kir-dev
mkdir ~/Programs

#######################
## Software installs ##
#######################

# Install packages from apt
sudo apt install -y gedit vim htop gtk-redshift rofi virt-manager htop fonts-firacode

# Install zsh
apt install zsh

# Install oh-my-zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Spotify
# 1. Add the Spotify repository signing keys to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install -y spotify-client

###########################
## Copy dotfiles to home ##
###########################

cp dotfiles/* ~
cp art ~ 

##########################
## Copy oh-my-zsh theme ##
##########################

cp wired.zsh-theme ~/.oh-my-zsh/themes/
