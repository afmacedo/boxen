class people::afmacedo {
  # useful stuff
  include macvim
  #include vim
  include wget
  include iterm2::dev
  include adium
  #include shiftit
  include slate
  include limechat
  include mysql
  #include firefox
  #include gitx
  include sourcetree
  include keepassx
  include chrome
  include vagrant
  include nodejs
  include nginx
  include virtualbox

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"
  $bundle = "${dotfiles}/vim/bundle"
  $nerdtree = "${bundle}/nerdtree"
  $puppetvim = "${bundle}/puppet-syntax-vim"

  file { $dotfiles:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $dotfiles:
    source => "afmacedo/dotfiles",
    require => File[$dotfiles]
  }

  file { [ $bundle, $nerdtree, $puppetvim ]:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $nerdtree:
    source => "scrooloose/nerdtree.git",
    require => File[$nerdtree]
  }

  repository { $puppetvim:
    source => "puppetlabs/puppet-syntax-vim.git",
    require => File[$puppetvim]
  }

  exec { "make install":
    cwd => "${dotfiles}",
    command => "/usr/bin/make",
    creates => "${home}/.bashrc",
    require => Repository[$dotfiles]
  }
}
