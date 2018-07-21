#
# Cookbook Name:: xampp
# Recipe:: default
# Author Name :: S.R.Gogularaja
#
# All rights reserved - Do Not Redistribute
#

=begin
#Download xampp server
remote_file "#{node['xampp']['download_path']}" do
  source "#{node['xampp']['download_url']}"
  action :create_if_missing
end

windows_package 'install xampp' do
  source 'https://s3.amazonaws.com/core-setup-files/xampp-win32-5.6.30-0-VC11-installer.exe'
  installer_type :custom
  options '--mode unattended'
end
=end

#start the xampp service
execute "start xampp service" do
  cwd "C:\\xampp"
  command "xampp_start.exe"
end

#Change phpmyadmin configuration
template "C:\\xampp\\phpMyAdmin\\config.inc.php" do
  source "config.inc.php.erb"
  variables ({
    :auth_type => "#{node['xampp']['auth_type']}"
  })
end

#Set phpmyadmin password (given ignore_failure because the script should not fail during re-run from corestack)
execute "set phpmyadmin password" do
  cwd "C:\\xampp\\mysql\\bin"
  command "mysqladmin.exe -u root password #{node['xampp']['phpmyadmin_password']}"
  ignore_failure true
end


#Change httpd config to access phpmyadmin outside the network
template "C:\\xampp\\apache\\conf\\extra\\httpd-xampp.conf" do
  source "httpd-xampp.conf.erb"
  variables ({
    :phpmyadmin_access => "#{node['xampp']['phpmyadmin_access']}"
  })
end


#Change httpd config to list only the folders in phpmyadmin
template "C:\\xampp\\apache\\conf\\httpd.conf" do
  source "httpd.conf.erb"
  variables ({
    :DocumentRoot_Path => "#{node['xampp']['DocumentRoot_Path']}"
  })
end


#stop the xampp service
execute "stop xampp service" do
  cwd "C:\\xampp"
  command "xampp_stop.exe"
end

#start the xampp service
execute "start xampp service" do
  cwd "C:\\xampp"
  command "xampp_start.exe"
end


#Allow httpd app through firewall
batch "allow httpd app through firewall" do
  cwd "C:\\"
  code 'netsh advfirewall firewall add rule name="Apache HTTP Server" dir=in action=allow program="c:\\xampp\\apache\\bin\\httpd.exe" enable=yes'
end  


=begin
#Install xampp server
batch "install xampp server" do
  cwd "C:\\"
  code "xampp-win32-5.6.30-0-VC11-installer.exe --mode unattended"
end
=end
