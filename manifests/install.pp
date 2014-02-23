class minecraft::install (
    $jar_url,
    $install_dir,
) {
    
    # Server installation directory.
    file {$install_dir:
        ensure => directory,
        owner  => 'minecraft',
        group  => 'minecraft',
        mode   => '0644',
    }

    # Jar install script.
    file {"${install_dir}/jar-install.sh":
        content => template('minecraft/jar-install.sh.erb'),
        owner   => 'minecraft',
        group   => 'minecraft',
        mode    => '0744',
        require => File[$install_dir],

    }

    exec {'jar-install':
        user    => 'minecraft',
        command => "${install_dir}/jar-install.sh ${jar_url}",
        creates => "${install_dir}/minecraft-server.jar",
        require => File["${install_dir}/jar-install.sh"],
    }

}
