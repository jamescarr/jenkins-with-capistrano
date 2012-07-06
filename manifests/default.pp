node default {
  include jenkins
  
  jenkins::plugin {
    'git': ;
    'github': ;
    'gradle': ;
    'clone-workspace-scm': ;
    'job-import-plugin': ;
  }
  user {"jenkins":
    ensure => present,
    shell  => '/bin/bash',
    home   => '/var/lib/jenkins'
  }
  package {'capistrano':
    ensure   => 'installed',
    provider => 'gem',
  }
  package {'capistrano-ext':
    ensure   => 'installed',
    provider => 'gem',
  }
}
