#
# Cookbook Name:: swapfile
# Recipe:: default
# Name : S.R.GogulaRaja
#
#
# All rights reserved - Do Not Redistribute
#

#find the available space in disk
execute "find the total space" do
  command <<-EOH
    totalspace=`df -m /mnt/ | awk '{print $2}' | tail -1`
    if [ #{node['swapfile']['swapsize_inMB']} -lt $totalspace ]
    then
      echo "Swap file can be created"
    else
      echo "Unable to create swap file, because Total space is only $totalspace MB"
      exit 1
    fi
  EOH
end


#Change swap file configuration
template "/etc/waagent.conf" do
  source "waagent.conf.erb"
  variables ({
    :resource_disk_format => node['swapfile']['resource_disk_format'],
    :enable_swap => node['swapfile']['enable_swap'],
    :swapsize_inMB => node['swapfile']['swapsize_inMB']  
  })
end


#Restart walinuxagent service
execute "restart walinuxagent" do
  command "service #{node['swapfile']['servicename']} restart"
end
