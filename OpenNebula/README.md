OpenNebula Cookbook
===================
This cookbook is used to install and configure opennebula in ubuntu 14.04 server


Requirements
------------
ubuntu 14.04


Attributes
----------
#OpenNebula input
default['OpenNebula']['sunstone_allowed_host_ip'] = '0.0.0.0'
default['OpenNebula']['owner'] = 'oneadmin'
default['OpenNebula']['group'] = 'oneadmin'
default['OpenNebula']['password'] = 'oneadmin'

#Config file path
default['OpenNebula']['ssh_config'] = '/var/lib/one/.ssh/config'
default['OpenNebula']['network_config'] = '/etc/network/interfaces.d/eth0.cfg'
default['OpenNebula']['qemu_config'] = '/etc/libvirt/qemu.conf'


Usage
-----
#### OpenNebula::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `OpenNebula` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[OpenNebula]"
  ]
}
```

License and Authors
-------------------
Authors: TODO: S.R.GOGULARAJA
