# swapfile Cookbook

This cookbook is used to create swapfile in linux azure virtual machine


### Platforms

Ubuntu
Centos
Redhat


## Attributes

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



## Usage

### swapfile::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `swapfile` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[swapfile]"
  ]
}
```


## License and Authors

Authors: S.R.GOGULARAJA

