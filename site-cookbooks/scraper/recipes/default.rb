#
# Cookbook Name:: scraper
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')
data_ids.each do |id|

    u = data_bag_item('users', id)

    bash "cpan-modules install" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        source /home/#{id}/.bash_profile
        cpanm Web::Scraper
      EOF
    end

end
