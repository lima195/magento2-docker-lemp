# docker-lemp 

### Stack:

* Nginx:lastest
* PHP-FPM versions available: 5.6, 7.2, 7.3 & 7.4
* Composer: v1.10.8
* Mysql versions available: 5.7 & 8.0
* Node: 12.20.0
* npm: 6.14.8
* Adminer: 4.7.6
* Elasticsearch: 7.6.0
* RabbitMQ: 3
* MailHog

### Support

| PHP Version | 5.6 | 7.2 | 7.3 | 7.4 |
| - | - | - | - | - |
| Composer: v1.10.8 | YES | YES | YES | YES |
| Node: 12.20.0 | NO | YES | YES | YES |
| npm: 6.14.8 | NO | YES | YES | YES |
| Adminer: 4.7.6 | YES | YES | YES | YES |
| Elasticsearch: 7.6.0 | YES | YES | YES | YES |
| RabbitMQ: 3 | YES | YES | YES | YES |
| MailHog | NO | YES | YES | YES |

### Requeriments

- docker >= v18
- docker-compose

### Install:

- `git clone https://github.com/lima195/docker-lemp.git;`
- `cd docker-lemp;`
- `docker-compose up -d;`
- add http://mage.com/ to your /etc/hosts
- check your http://mage.com/

---

### PHP 

You can change php version in `.env` file.

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

You can change mysql version and credentials in `.env` file.


### Files:

- php website dir: ../www
- nginx config: ./nginx_conf/magento.conf
- xdebug: ./php${PHP_VERSION}/docker-php-ext-xdebug.ini

### Useful commands examples

- login to php container:
`bin/php bash`

- run magento commands:
`bin/magento setup:upgrade`

- import db:
`bin/mysql-import ../file_database_path.sql`

- export db:
`bin/mysql-export ../file_database_path.sql`

- login into db container:
`docker-compose exec db bash`

### Xdebug config:

- auto start = 1
- port = 9003
- idekey = "docker"

#### Phpstorm

Configurations on phpstorm:

#### Main menu > file > settings > Languages & Frameworks > PHP > Debug:

* Debug port: 9000,9003

#### Main menu > file > settings > Languages & Frameworks > PHP > Debug > DBGp Proxy:

* IDE Key: `docker`
* Host: http://mage.com/
* Port: 9000

#### (Optional) Main menu > file > settings > Languages & Frameworks > PHP:

* CLI Interpreter: 
* > Server: Docker
* > Configuration File: (Path to yours docker-compose.yml on your docker dir)
* > Service: php

#### Main menu > file > settings > Languages & Frameworks > PHP >> Servers:

* Name: My Debug Server
* Host: http://mage.com/
* Port: 80
* Debugger: Xdebug
* Use path mapping: YES
* > File/Directory: (your website www dir)
* > Absolute path on the server: /usr/share/nginx/www

#### Debug Connections > Edit Configuratons -> Add a new Connection -> PHP Remote Debug

#### Debug Connections > Edit Configuratons > Run/Debug Configurations:

* Server: Choose that server that you created (My Debug Server)
* IDE KEY: `docker`
