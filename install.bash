#!/bin/bash

echo "minweb installation wizard";

echo "Updating git repo";
git pull &>/dev/null;
read -p "Do you want to install support for *.php scripts? [Yn] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install php php-fpm;
fi
read -p "Do you want to install support for *.pas scripts? [Yn] " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt install fpc;
fi


echo "All done  :) use 'bash run.bash'"
