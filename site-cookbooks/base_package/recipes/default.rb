#
# Cookbook Name:: base_package
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
 %w{tree nkf git gcc make vim}.each do |pkg|
    package pkg do
        action :install
    end
end
