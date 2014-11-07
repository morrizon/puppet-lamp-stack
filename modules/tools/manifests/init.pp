class tools {

  # package install list
  $packages = [
    "curl",
    "vim",
    "htop",
    "sendmail",
    "git",
    "python-software-properties",
  ]

  # install packages
  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

}
