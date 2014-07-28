
# Cookbook Name:: crowler
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
git "/home/vagrant/Crowler" do
    repository "git://github.com/takuya542/Scraper.git"
    revision "master"
    action :sync
    user "vagrant"
    group "vagrant"
end

bash "deploy tables" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    mysql -u root < ./Scraper/Model/video_data.sql
    EOF
end
