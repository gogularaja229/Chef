#
# Cookbook Name:: xampp
# attributes:: default
# Author Name :: S.R.Gogularaja
#
# All rights reserved - Do Not Redistribute
#

#Download url & path
default['xampp']['download_url'] = "https://s3.amazonaws.com/core-setup-files/xampp-win32-5.6.30-0-VC11-installer.exe"
default['xampp']['download_path'] = "C:\\xampp-win32-5.6.30-0-VC11-installer.exe"

#php myadmin configuration
default['xampp']['auth_type'] = "cookie"

#php myadmin password
default['xampp']['phpmyadmin_password'] = "password"

#httpd configuration
default['xampp']['phpmyadmin_access'] = "all granted"
default['xampp']['DocumentRoot_Path'] = "C:/xampp/htdocs"
