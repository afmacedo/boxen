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
  include sublime_text_3
  include sublime_text_3::package_control

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

  sublime_text_3::package { 'Easyballs':
    source => 'afmacedo/sublime-themes'
  }

  sublime_text_3::package { 'Alignment':
    source => 'wbond/sublime_alignment'
  }

  sublime_text_3::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  sublime_text_3::package { 'ChangeQuotes':
    source => 'colinta/SublimeChangeQuotes'
  }

  sublime_text_3::package { 'SideBarEnhancements':
    source => 'titoBouzout/SideBarEnhancements'
  }

  sublime_text_3::package { 'BufferScroll':
    source => 'titoBouzout/BufferScroll'
  }

  sublime_text_3::package { 'DetectSyntax':
    source => 'phillipkoebbe/DetectSyntax'
  }

  sublime_text_3::package { 'ExpandSelectionToQuotes':
    source => 'kek/sublime-expand-selection-to-quotes'
  }

  sublime_text_3::package { 'IndentGuides':
    source => 'SublimeText/IndentGuides'
  }

  sublime_text_3::package { 'DotfilesSyntaxHighlighting':
    source => 'mattbanks/dotfiles-syntax-highlighting-st2'
  }

  sublime_text_3::package { 'PuppetSyntaxHighlighting':
    source => 'eklein/sublime-text-puppet'
  }

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
