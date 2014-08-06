
# Cookbook Name:: crowler
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
git "/home/onda/Crowler" do
    repository "git://github.com/takuya542/Scraper.git"
    revision "master"
    action :sync
    user "onda"
    group "onda"
end

bash "deploy tables" do
    user 'onda'
    group 'onda'
    cwd '/home/onda'
    environment "HOME" => '/home/onda'
    code <<-EOF
    mysql -u root < ./Scraper/Model/video_data.sql
    EOF
end
