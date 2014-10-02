class php {

  # package install list
  $packages = [
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "libapache2-mod-php5"
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"],
		before => File["/etc/php5/conf.d/timezone.ini"],
  }

  # set php timezone
  file { "/etc/php5/conf.d/timezone.ini":
    ensure => "present",
    content => "date.timezone = 'Atlantic/Canary'",
    mode => 644,
		require => Package[$packages],
  }
}
