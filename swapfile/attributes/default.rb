#
# Cookbook Name:: swapfile
# Attributes:: default
# Name : S.R.GogulaRaja
#
#
# All rights reserved - Do Not Redistribute
#


#swap file inputs
default['swapfile']['resource_disk_format'] = "y"
default['swapfile']['enable_swap'] = "y"
default['swapfile']['swapsize_inMB'] = "2048"



#waagent service name
if node['platform'] == 'ubuntu'
  default['swapfile']['servicename'] = 'walinuxagent'
else
  default['swapfile']['servicename'] = 'waagent'
end
