puppet-minecraft
================

Puppet module for installing and managing a Vanilla Minecraft Server (1.7.x).


Example Usage
================

Add this in your /etc/puppet/manifests/site.pp. All possible options and defaults are found in manifests/init.pp and manifests/defaults.pp respectively.

If you use the https://github.com/puppetlabs/puppetlabs-firewall module (i.e. if class['firewall'] is defined), the module will also add firewall rules automatically based on your $open\_rcon\_port, $open\_query\_port and $open\_server\_port settings.

```puppet
node 'hostname' {
  class {'minecraft':
      min_memory          => '800M',
      max_memory          => '2048M',
      level_name          => 'World',
      difficulty          => 3,
      level_seed          => '-840222844129379185',
      op_permission_level => 4,
      server_name         => 'Minecraft Server',
      motd                => 'Minecraft Server MOTD',
      white_list          => true,
      max_players         => 30,
      enable_rcon         => true,
      rcon_password       => 'abcdefgh876543210',
  }
}
```
