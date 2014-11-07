# Entorno LAMP

## Créditos
* [jrodriguezjr/puppet-lamp-stack](https://github.com/jrodriguezjr/puppet-lamp-stack).

## Prerrequisitos
* [Vagrant](http://www.vagrantup.com/)
* [Virtual Box](https://www.virtualbox.org/)

## Instrucciones
1. Asegúrate que Vagrant y Virtual Box están instalados.

2. Instala una Ubuntu 12.04 (precise) como box de Vagrant en el caso de no tenerla instalada.

        $ vagrant box add precise32 http://files.vagrantup.com/precise32.box

3. Abre una terminal y sitúate en el directorio de este documento y a continuación crea la máquina virtual.

        $ vagrant up

4. Conectar a la máquina virtual vía ssh.

				$ vagrant ssh

5. La primera vez dentro de la máquina se deben instalar los plugins de vim.

				 vagrant@lamp:~$ vim +PluginInstall +qall

6. Una vez instalados ya podemos empezar a trabajar en la carpeta con el código de la aplicación.

				 vagrant@lamp:~$ cd /vagrant/www

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

## Plugins de VIM
* [Vundle.vim](https://github.com/gmarik/Vundle.vim)
* [vim-phpqa](https://github.com/joonty/vim-phpqa)
* [vim-phpunitqf.git](https://github.com/joonty/vim-phpunitqf.git)
* [vim-misc](https://github.com/xolox/vim-misc)
* [vim-reload](https://github.com/xolox/vim-reload)

## TODO

* Mejorar configuración vim como IDE de PHP.
* Documentar el uso del IDE.
* Personalización de la máquina vía Hiera.
