#!/bin/bash
[ -z "$1" ] && echo "Please specify a dir project name" && exit


[ -d ~/projects ] || mkdir ~/projects

cd ~/projects;
mkdir "$@";
cd "$@";

git clone https://github.com/lima195/docker-lemp.git;
mkdir www;

cd docker-lemp;
cp composer/auth.json.example composer/auth.json;
vim composer/auth.json;
docker-compose up -d;

bin/magento-install 2.3.4;
docker-compose down;
docker-compose up -d;

echo " - - - - - - - - - - - - - - - - - - - - - - - -";
echo "";
echo "Done!";
echo "";
echo "You can find this project at ~/projects/$@";
echo "Docker folder: ~/projects/$@/docker-lemp";
echo "Magento folder: ~/projects/$@/www";
echo "";
echo " - - - - - - - - - - - - - - - - - - - - - - - -";
echo "";
echo "Finish your instalation at http://localhost";
echo "";
echo " - - - - - - - - - - - - - - - - - - - - - - - -";
echo "";
echo "Your db info:";
source "$HOME/projects/$@/docker-lemp/env/db.env"
echo "";
echo "adminer: http://localhost:8080";
echo "database: ${MYSQL_DATABASE}";
echo "user: root";
echo "pass: ${MYSQL_ROOT_PASSWORD}";
echo "host: ${MYSQL_HOST}";
echo "";
echo " - - - - - - - - - - - - - - - - - - - - - - - -";
echo "";
echo "Do not forget!";
echo " - Change your magento deploy mode to developer as soon as possible";
echo " - Run php commands in docker folder and git commands in magento folder";
echo "";


