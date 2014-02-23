class minecraft::firewall (
    $server_port,
    $enable_query,
    $query_port,
    $enable_rcon,
    $rcon_port,
    $open_server_port,
    $open_rcon_port,
    $open_query_port,
) {

    if $open_server_port {
        firewall {'003 accept incoming connections to the MC server.':
            proto  => 'tcp',
            dport  => $server_port,
            action => 'accept',
        }
    }

    if $open_query_port and $enable_query {
        firewall {'003 accept incoming status queries to the MC server.':
            proto  => 'udp',
            dport  => $query_port,
            action => 'accept',
        }
    }
    if $open_rcon_port and $enable_rcon {
        firewall {'003 accept incoming RCON connections to the MC server.':
            proto  => 'tcp',
            dport  => $rcon_port,
            action => 'accept',
        }
    }
}
