class minecraft::requirements {


    apt::source {'webupd8team-java':
        location => 'http://ppa.launchpad.net/webupd8team/java/ubuntu',
        release  => 'precise',
        repos    => 'main',
        key      => 'EEA14886',
    }
 
   
    exec { 'accept-java-license':
        command => '/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections;/bin/echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 seen true | sudo /usr/bin/debconf-set-selections;',
        creates => '/usr/lib/jvm/java-6-oracle'
      }

    package { 'oracle-java6-installer':
       ensure  => installed,
       require => [Apt::Source['webupd8team-java'], Exec['accept-java-license']],
    }
}
