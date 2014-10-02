class php::composer {
  include php

  # install composer
  exec { "composer":
    command => "curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin;mv /usr/local/bin/composer.phar /usr/local/bin/composer",
		creates => "/usr/local/bin/composer"
	}
}
