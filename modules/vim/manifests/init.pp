class vim {

  file { "/home/vagrant/.vim":
    ensure => "directory",
    owner => vagrant,
    group => vagrant,
  }

  file { "/home/vagrant/.vimrc":
    ensure => present,
    source => "/vagrant/manifests/vim/.vimrc",
    require => File["/home/vagrant/.vim"],
    owner => vagrant,
    group => vagrant,
  }
  
  file { "/home/vagrant/.vim/phpmd.xml":
    ensure => present,
    source => "/vagrant/manifests/vim/phpmd.xml",
    require => File["/home/vagrant/.vim"],
    owner => vagrant,
    group => vagrant,
  }

  file { "/home/vagrant/.vim/bundle":
    ensure => "directory",
    require => File["/home/vagrant/.vim"],
    owner => vagrant,
    group => vagrant,
  }

  file { "/home/vagrant/.vim/after":
    ensure => "directory",
    require => File["/home/vagrant/.vim"],
    owner => vagrant,
    group => vagrant,
  }

  file { "/home/vagrant/.vim/after/ftplugin":
    ensure => "directory",
    require => File["/home/vagrant/.vim/after"],
    owner => vagrant,
    group => vagrant,
  }

  file { "/home/vagrant/.vim/after/ftplugin/php.vim":
    ensure => present,
    source => "/vagrant/manifests/vim/php.vim",
    require => File["/home/vagrant/.vim/after/ftplugin"],
    owner => vagrant,
    group => vagrant,
  }

  exec { "vundle":
    command => "git clone https://github.com/gmarik/Vundle.vim.git /home/vagrant/.vim/bundle/Vundle.vim",
    require => [Package["git"],File["/home/vagrant/.vim/bundle"]],
    user => vagrant,
  }

# FIXME: error when provision
#  exec { "vim +PluginInstall +qall":
#    require => [Package["vim"],File["/home/vagrant/.vimrc"],Exec["vundle"]],
#    user => vagrant,
#  }

}
