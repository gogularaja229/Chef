#
# Cookbook Name:: OpenNebula
# attributes:: default
#
#

#OpenNebula input
default['OpenNebula']['sunstone_allowed_host_ip'] = '0.0.0.0'
default['OpenNebula']['owner'] = 'oneadmin'
default['OpenNebula']['group'] = 'oneadmin'
#default['OpenNebula']['password'] = 'oneadmin'

#Config file path
default['OpenNebula']['cred_file'] = '/var/lib/one/.one/one_auth'
default['OpenNebula']['ssh_config'] = '/var/lib/one/.ssh/config'
default['OpenNebula']['network_config'] = '/etc/network/interfaces.d/eth0.cfg'
default['OpenNebula']['qemu_config'] = '/etc/libvirt/qemu.conf'
