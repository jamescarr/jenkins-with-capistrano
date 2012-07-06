import "rvm"

node default {
  include jenkins
  include rvm
  
  jenkins::plugin {
    'git': ;
    'github': ;
    'gradle': ;
    'clone-workspace-scm': ;
  }
  
  group { 
    "puppet" :
      ensure => present;
  }

  $ruby_18 = "ruby-1.8.7-p352"
  $ruby_19 = "ruby-1.9.2-p290"

  user {
    "jenkins" :
      ensure => present;
    "vagrant" :
      ensure => present;
  }

  rvm::system_user {
    "jenkins" :
      require => User["jenkins"];
  
    "vagrant" :
      require => User["vagrant"];
  }

  if $rvm_installed == "true" {
    notice("Building Rubies..")
    rvm_system_ruby {
      "$ruby_19" :
        ensure => "present",
        require => Exec["system-rvm"],
        default_use => true;
      "$ruby_18" :
        ensure => "present",
        require => Exec["system-rvm"],
        default_use => false;
    }
    rvm_gem {
      'ruby-1.9.2-p290/capistrano': ;
      'ruby-1.9.2-p290/capistrano-ext': ;
      'ruby-1.9.2-p290/puppet': ;
    }
  }

}
