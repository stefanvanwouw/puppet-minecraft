class minecraft::user {

    # Minecraft User and Group.
    group {'minecraft':
        ensure => present,
    }

    user {'minecraft':
        ensure  => present,
        shell   => '/bin/bash',
        gid     => 'minecraft',
        require => Group['minecraft'],
    }

}
