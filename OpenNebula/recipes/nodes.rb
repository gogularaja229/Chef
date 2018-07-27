#Install nodes and additional packages
%w{opennebula-node nfs-common bridge-utils}.each do |pkg|
  package pkg do
    action :install
  end
end


#Creating cfg file for network
template "#{node['OpenNebula']['network_config']}" do
  source "eth0.cfg.erb"
  owner "root"
  group "root"
  mode "644"
end


#Creating new bridge
execute "create new bridge" do
  command <<-EOF
  brctl addbr br0
  ifconfig br0 up
  EOF
end


#Create conf file for qemu
template "#{node['OpenNebula']['qemu_config']}" do
  source "qemu.conf.erb"
  owner "root"
  group "root"
  mode "644"
end


#restaring libvit-bin service
service "libvirt-bin" do
  action :restart
end

#Reading the password
ruby_block "fetching username and password" do
  block do
    read_file = File.read("#{node['OpenNebula']['cred_file']}")
    text = read_file.split(":")
    node.set['OpenNebula']['Username'] = text[0]
    node.set['OpenNebula']['password'] = text[1]
  end
end

=begin
#set the password
execute "setting the password" do
  user "oneadmin"
  command <<-EOF
  oneuser passwd 0 oneadmin
  echo "oneadmin:#{node['OpenNebula']['password']}" > /var/lib/one/.one/one_auth
  echo "oneadmin:#{node['OpenNebula']['password']}" >> /var/lib/one/.one/occi_auth
  echo "oneadmin:#{node['OpenNebula']['password']}" >> /var/lib/one/.one/sunstone_auth
  one stop
  one start
  EOF
end

#Create password injection file
template '/tmp/oneadmin_auth.sh' do
  source 'oneadmin_auth.sh.erb'
  owner "#{node['OpenNebula']['owner']}"
  group "#{node['OpenNebula']['group']}"
  mode '0777'
  variables ({
    :password => node['OpenNebula']['password']
  })
end

#set the password
execute "setting the password" do
  user "oneadmin"
  cwd "/var/lin/one/.one/"
  command <<-EOF
  oneuser passwd 0 oneadmin
  sh /tmp/oneadmin_auth.sh
  one stop
  one start
  EOF
end
=end
