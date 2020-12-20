#!/bin/bash
mv /usr/share/nginx/www/project-community-edition /home/john/;
rm -rf /usr/share/nginx/www/.*;
rm -rf /usr/share/nginx/www/*;
cp /home/john/project-community-edition/.* /usr/share/nginx/www -r;