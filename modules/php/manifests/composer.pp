class php::composer {
  include php

  # install composer
  exec { "composer":
    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin;mv /usr/local/bin/composer.phar /usr/local/bin/composer",
		creates => "/usr/local/bin/composer"
	}

  # create directory for composer vendors
  file { "/usr/local/composer":
    ensure => directory,
    recurse => true,
    purge => true,
    force => true,
    before => File["/usr/local/composer/composer.json"],
    require => Exec["composer"],
  }

	file { "/usr/local/composer/composer.json":
    ensure => present,
    source => "/vagrant/manifests/composer/composer.json",
	}

  exec { "composer-update":
		command => "composer update",
		require => File["/usr/local/composer/composer.json"],
    cwd => "/usr/local/composer",
	}

	# set global PATH for composer vendors
  file_line { "composer-path":
		path => "/etc/bash.bashrc",
	  line => 'test -d "/usr/local/composer/vendor/bin" && PATH="/usr/local/composer/vendor/bin:$PATH"',
		match => "local/composer/vendor",
  }

}
