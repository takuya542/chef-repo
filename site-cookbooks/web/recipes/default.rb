#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

data_ids = data_bag('users')
data_ids.each do |id|

    u = data_bag_item('users', id)

    # Scraper
    git "/home/#{id}/Scraper" do
      repository "git://github.com/takuya542/Scraper.git"
      revision "master"
      action :sync
      user  u['id']
      group u['id']
    end

    # Web
    git "/home/#{id}/Web" do
      repository "git://github.com/takuya542/web.git"
      revision "master"
      action :sync
      user  u['id']
      group u['id']
    end

    # DB展開
    bash "cpan-modules install" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        mysql -u root < /home/#{id}/Scraper/Model/video_data.sql
      EOF
    end

end
