class minecraft (
    $jar_url,
    $install_dir                  = $::minecraft::defaults::install_dir,
    $min_memory                   = $::minecraft::defaults::min_memory,
    $max_memory                   = $::minecraft::defaults::max_memory,
    $open_server_port             = $::minecraft::defaults::open_server_port,
    $open_rcon_port               = $::minecraft::defaults::open_rcon_port,
    $open_query_port              = $::minecraft::defaults::open_query_port,

    $allow_flight                 = $::minecraft::defaults::allow_flight,
    $allow_nether                 = $::minecraft::defaults::allow_nether,
    $announce_player_achievements = $::minecraft::defaults::announce_player_achievements,
    $difficulty                   = $::minecraft::defaults::difficulty,
    $enable_command_block         = $::minecraft::defaults::enable_command_block,
    $force_gamemode               = $::minecraft::defaults::force_gamemode,
    $gamemode                     = $::minecraft::defaults::gamemode,
    $generate_structures          = $::minecraft::defaults::generate_structures,
    $generator_settings           = $::minecraft::defaults::generator_settings,
    $spawn_animals                = $::minecraft::defaults::spawn_animals,
    $spawn_monsters               = $::minecraft::defaults::spawn_monsters,
    $spawn_npcs                   = $::minecraft::defaults::spawn_npcs,
    $spawn_protection             = $::minecraft::defaults::spawn_protection,
    $hardcore                     = $::minecraft::defaults::hardcore,
    $level_name                   = $::minecraft::defaults::level_name,
    $level_seed                   = $::minecraft::defaults::level_seed,
    $level_type                   = $::minecraft::defaults::level_type,
    $max_build_height             = $::minecraft::defaults::max_build_height,
    $max_players                  = $::minecraft::defaults::max_players,
    $motd                         = $::minecraft::defaults::motd,
    $online_mode                  = $::minecraft::defaults::online_mode,
    $op_permission_level          = $::minecraft::defaults::op_permission_level,
    $player_idle_timeout          = $::minecraft::defaults::player_idle_timeout,
    $pvp                          = $::minecraft::defaults::pvp,
    $enable_query                 = $::minecraft::defaults::enable_query,
    $query_port                   = $::minecraft::defaults::query_port,
    $enable_rcon                  = $::minecraft::defaults::enable_rcon,
    $rcon_password                = $::minecraft::defaults::rcon_password,
    $rcon_port                    = $::minecraft::defaults::rcon_port,
    $resource_pack                = $::minecraft::defaults::resource_pack,
    $server_ip                    = $::minecraft::defaults::server_ip,
    $server_port                  = $::minecraft::defaults::server_port,
    $server_name                  = $::minecraft::defaults::server_name,
    $snooper_enabled              = $::minecraft::defaults::snooper_enabled,
    $view_distance                = $::minecraft::defaults::view_distance,
    $white_list                   = $::minecraft::defaults::white_list,
) inherits minecraft::defaults {
    require minecraft::requirements
    require minecraft::user


    class {'minecraft::install':
       jar_url     => $jar_url,
       install_dir => $install_dir,
    }


    # Server's properties.
    file {"${install_dir}/server.properties":
        content => template('minecraft/server.properties.erb'),
        owner   => 'minecraft',
        group   => 'minecraft',
        mode    => '0644',
        require => File[$install_dir],
    }




    # The Upstart service file.
    file {'/etc/init/minecraft-server.conf':
        content => template('minecraft/minecraft-server.conf.erb'),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
        notify  => Service['minecraft-server'],
        require => File[$install_dir],
    }

    class {'minecraft::firewall':
        server_port => $server_port,
        enable_query => $enable_query,
        enable_rcon => $enable_rcon,
        query_port  => $query_port,
        rcon_port   => $rcon_port,
        open_rcon_port => $open_rcon_port,
        open_server_port => $open_server_port,
        open_query_port => $open_query_port,
    }

    # The service that runs the server.
    service {'minecraft-server':
        ensure  => running,
        provider => 'upstart',
        require => [
            File['/etc/init/minecraft-server.conf'],
            Class['minecraft::firewall'],
            Class['minecraft::install'],
        ],
    }
    

}
