# docker-lemp 

### Stack:

* Nginx:lastest
* Php-fpm 7.2
* Composer v1.10.8
* Mysql:5.7
* Node:12.20.0
* Npm:6.14.8
* Adminer 4.7.6

### Requeriments

- docker > v18
- docker-compose
- mysql-cli (optional, required for db import)

### Install:

- `git clone https://github.com/lima195/docker-lemp.git;`
- `cd docker-lemp;`
- `docker-compose up -d;`
- check your http://localhost/

### Init new magento 2.3.4 project

`wget https://raw.githubusercontent.com/lima195/docker-lemp/master/new-project.sh`
`chmod +x new-project.sh;`
`./new-project.sh magento-new-project-name;`

---

### PHP Extensions:

* iconv, 
* mbstring, 
* bcmath, 
* xls, 
* intl, 
* gd, 
* mysqli, 
* pdo_mysql, 
* soap, 
* zip, 
* xmlrpc, 
* opcache, 
* mcrypt, 
* bcmath
* xdebug

### Mysql info:

- Adminer URL: http://localhost:8080/
- db name: app
- user: app
- pass: app
- host: db
- root user: root
- root pass: root

### Files:

- project php dir: ../www
- nginx config: ./nginx_conf/default.conf
- xdebug: ./etc/php_ini/docker-php-ext-xdebug.ini

### Useful commands examples

- login to php container:
`bin/php bash`

- login to assets container:
`bin/assets bash`

- run php command without logged into container:
`bin/assets php foo_bar_file_example.php`

- run artisans commands:
`bin/artisan migrate`

- run magento commands:
`bin/magento setup:upgrade`

- import db:
`bin/mysql-import ../file_database_path.sql`

- login into db container:
`docker-compose exec db bash`

- login into mysql cli (inside db container):
`mysql -u app -papp app`

### Xdebug config:

- xdebug.remote_enable=1
- xdebug.remote_port=9000
- xdebug.remote_autostart=1
- xdebug.idekey="docker"
- xdebug.default_enable=1
- xdebug.remote_host=10.254.254.254

#### Phpstorm

Linux configuration:

- 1. run `ifconfig` and find yours last adapter, should be something like *wlp7s0*, if so, run command (if not, switch to yours where is wlp7s0):
- 2. `sudo ip addr add 10.254.254.254/24 brd + dev wlp7s0 label wlp7s0:1`

Configurations on phpstorm:

#### Main menu > file > settings > Languages & Frameworks > PHP > Debug:

* Debug port: 9000

#### Main menu > file > settings > Languages & Frameworks > PHP > Debug > DBGp Proxy:

* IDE Key: `docker`
* Host: 10.254.254.254
* Port: 9000

#### Main menu > file > settings > Languages & Frameworks > PHP:

* CLI Interpreter: 
* > Server: Docker
* > Configuration File: (Path to yours docker-compose.yml on your docker dir)
* > Service: php

#### Main menu > file > settings > Languages & Frameworks > PHP > Servers:

* Name: localhost
* Host: 10.254.254.254
* Port: 80
* Debugger: Xdebug
* Use path mapping: YES
* > File/Directory: (your www dir)
* > Absolute path on the server: /usr/share/nginx/www
