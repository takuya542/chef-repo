#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" do
    action :install
end

template "/etc/my.cnf" do
    source "my.conf.erb"
    owner "root"
    group "root"
    mode 644
    notifies :relode, 'service[mysqld]'
end

service "mysqld" do
    action [ :enable, :start ]
end
