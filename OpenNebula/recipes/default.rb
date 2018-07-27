#
# Cookbook Name:: OpenNebula
# Recipe:: default
#
#

#Frontend installation
execute "install repo" do
  command <<-EOF
  wget -q -O- http://downloads.opennebula.org/repo/Ubuntu/repo.key | apt-key add -
  echo "deb http://downloads.opennebula.org/repo/Ubuntu/14.04 stable opennebula" > /etc/apt/sources.list.d/opennebula.list
  apt-get update
  EOF
end


#Install opennebula packages
%w{opennebula opennebula-sunstone nfs-kernel-server}.each do |pkg|
  package pkg do
    action :install
  end
end


#Sunstone configuration
execute "change sunstone configuration" do
  command "sed -i 's/127.0.0.1/#{node['OpenNebula']['sunstone_allowed_host_ip']}/g' /etc/one/sunstone-server.conf"
end

service "opennebula-sunstone" do
  action :restart
end


#Moving ssh key files
execute "configure ssh public key" do
  command 'sudo -u oneadmin cp /var/lib/one/.ssh/id_rsa.pub /var/lib/one/.ssh/authorized_keys'
end


#Moving the ssh config file
template "#{node['OpenNebula']['ssh_config']}" do
  source "ssh_config.erb"
  owner "#{node['OpenNebula']['owner']}"
  group "#{node['OpenNebula']['group']}"
  mode "600"
end


include_recipe "OpenNebula::nodes"
