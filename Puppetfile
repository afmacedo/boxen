# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.6.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "module-data",    "0.0.4", :repo => "ripienaar/puppet-module-data"
github "autoconf",       "1.0.0"
github "dnsmasq",        "1.0.0"
github "gcc",            "2.0.1"
github "git",            "2.6.0"
github "homebrew",       "1.9.4"
github "hub",            "1.0.3"
github "inifile",        "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",          "1.4.3"
github "nodejs",         "3.8.2"
#github "openssl",        "1.0.0"
github "repository",     "2.3.0"
github "ruby",           "8.1.3"
github "stdlib",         "4.3.2", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",           "1.0.0"
github "xquartz",        "1.2.0"
#github "sourcetree",     "1.0.0"
github "slate",          "1.0.1"
github "vim",            "1.0.5"
github "caffeine",       "1.0.0"
#github "macvim",	 "1.0.0"
github "wget",		 "1.0.1"
github "iterm2",	 "1.2.0"
github "adium",		 "1.4.0"
#github "shiftit",	 "0.0.2"
#github "gitx", 	 	"1.2.0"
github "limechat",	 "1.2.0", :repo => "dieterdemeyer/puppet-limechat"
github "mysql",		 "1.2.2"
github "firefox",	 "1.2.2"
#github "keepassx",	 "1.0.0"
github "vagrant",	 "3.2.0"
github "chrome",	 "1.2.0"
github "virtualbox",     "1.0.14", :repo => "afmacedo/puppet-virtualbox"
github "sublime_text_3", "1.0.1", :repo => "afmacedo/puppet-sublime_text_3"
github "onepassword",    "1.1.2"

