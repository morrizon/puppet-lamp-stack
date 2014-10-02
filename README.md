# Entorno LAMP

## Créditos
* [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack).

## Prerrequisitos
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Instrucciones
0. Asegúrate que Vagrant and Virtual Box están instalados.

1. Instala una Ubuntu 12.04 (precise) como box de Vagrant en el caso de no tenerla instalada.

        $ vagrant box add precise32 http://files.vagrantup.com/precise32.box

2. Abre una terminal y sitúate en el directorio de este documento y a continuación crea la máquina virtual.

        $ vagrant up

3. Conectar a la máquina virtual vía ssh.

				$ vagrant ssh

4. Una vez en la máquina ir a la carpeta con el código de la aplicación.

				$ cd /vagrant/www

## Paquetes incluidos

* apache2: mod rewrite activado, virtual host por defecto en manifests/sites-enabled/default.
* composer: paquetes instalados: PHP CodeSniffer y PHP Mess Detector
* curl
* htop
* git
* libapache2-mod-php5
* mysql-server
* php5
* php5-cli
* php5-dev
* php5-gd
* php5-mcrypt
* php5-mysql
* php-pear: paquetes instalados: phpunit y sus dependencias
* python-software-properties
* sendmail
* vim

## TODO

* Configuración de vim para que funcione como IDE de PHP.
* Personalización de la máquina vía Hiera.
