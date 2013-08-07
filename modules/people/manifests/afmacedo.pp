class people::afmacedo {
  # useful stuff
  include macvim
  include wget
  include iterm2::dev
  include adium
  include shiftit
  include gitx
  include limechat
  include mysql
  #include firefox
  include keepassx
  include chrome
  #include vagrant

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"
  $bundle = "${dotfiles}/vim/bundle"
  $nerdtree = "${bundle}/nerdtree"

  file { $dotfiles:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $dotfiles:
    source => "afmacedo/dotfiles",
    require => File[$dotfiles]
  }

  file { [ $bundle, $nerdtree ]:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $nerdtree:
    source => "scrooloose/nerdtree.git",
    require => File[$nerdtree]
  }
 
  exec { "make install":
    cwd => "${dotfiles}",
    command => "/usr/bin/make",
    creates => "${home}/.bashrc",
    require => Repository[$dotfiles]
  }
}
