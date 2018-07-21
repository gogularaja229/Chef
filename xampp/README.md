# xampp Cookbook

This cookbook is used to install xampp server in windows

## Requirements

windows machine with WinRM enabled


## Attributes

#Download url & path
default['xampp']['download_url'] = "https://s3.amazonaws.com/core-setup-files/xampp-win32-5.6.30-0-VC11-installer.exe"
default['xampp']['download_path'] = "C:\\xampp-win32-5.6.30-0-VC11-installer.exe"

#php myadmin configuration
default['xampp']['auth_type'] = "cookie"

#php myadmin password
default['xampp']['phpmyadmin_password'] = "XXXX"

#httpd configuration
default['xampp']['phpmyadmin_access'] = "all granted"
default['xampp']['DocumentRoot_Path'] = "C:/xampp/htdocs"


## Usage

### xampp::default

TODO: Write usage instructions for each cookbook.

e.g.
Just include `xampp` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[xampp]"
  ]
}
```

## License and Authors

Authors: TODO: S.R.GogulaRaja

