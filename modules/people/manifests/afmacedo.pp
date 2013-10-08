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
  include vim
  include caffeine

  $home = "/Users/${::boxen_user}"
  $dotfiles = "${home}/dotfiles"

  file { $dotfiles:
    ensure => "directory",
    owner => $::luser,
    group => "staff"
  }

  repository { $dotfiles:
    source => "afmacedo/dotfiles",
    require => File[$dotfiles]
  }

  vim::bundle { [
    "scrooloose/nerdtree",
    "scrooloose/syntastic",
    "puppetlabs/puppet-syntax-vim",
    "jelera/vim-javascript-syntax",
    "juvenn/mustache.vim",
    "guileen/vim-node",
    "Raimondi/delimitMate",
    "digitaltoad/vim-jade",
    "mattn/emmet-vim",
    "hdima/python-syntax",
    "kchmck/vim-coffee-script",
    "tpope/vim-sensible"
  ]: }

  exec { "make install":
    cwd => "${dotfiles}",
    command => "/usr/bin/make",
    creates => "${home}/.bashrc",
    require => Repository[$dotfiles]
  }

  service { "nginx":
    ensure => "running"
  }
}
