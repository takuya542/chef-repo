#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
data_ids = data_bag('users')
data_ids.each do |id|

    u = data_bag_item('users', id)

    %w{mercurial ncurses-devel}.each do |pkg|
      package pkg do
        action :install
      end
    end

    bash "install vim7-3" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        /home/#{id}/dotfiles/Installer/install_vim73.sh
      EOF
      creates "/home/#{id}/vim73"
    end

end
