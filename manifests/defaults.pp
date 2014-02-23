class minecraft::defaults {

    ## General settings.

    # The installation directory for all Minecraft server files.
    $install_dir = '/var/lib/minecraft'

    # Maximum memory the JVM should use.
    $min_memory = '1024M'

    # Minimum memory the JVM will allocate.
    $max_memory = '1024M'


    # server.properties settings, see http://minecraft.gamepedia.com/Server.properties for explanation.
    $allow_flight                 = false
    $allow_nether                 = true
    $announce_player_achievements = true

    $difficulty                   = 1

    $enable_command_block         = false

    $force_gamemode               = false
    $gamemode                     = 0

    $generate_structures          = true
    $generator_settings           = ''
    $spawn_animals                = true
    $spawn_monsters               = true
    $spawn_npcs                   = true
    $spawn_protection             = 16


    $hardcore                     = false

    $level_name                   = 'world'
    $level_seed                   = ''
    $level_type                   = 'DEFAULT'

    $max_build_height             = 256
    $max_players                  = 20
    $motd                         = 'A Minecraft Server'

    $online_mode                  = true
    $op_permission_level          = 4

    $player_idle_timeout          = 0
    $pvp                          = true


    $enable_query                 = false
    $query_port                   = 25565
    $open_query_port              = true

    $enable_rcon                  = false
    $rcon_password                = ''
    $rcon_port                    = 25575
    $open_rcon_port               = true

    $resource_pack                = ''

    $server_ip                    = ''
    $server_port                  = 25565
    $open_server_port             = true
    $server_name                  = 'Unknown Server'

    $snooper_enabled              = false

    $view_distance                = 10

    $white_list                   = false





}
