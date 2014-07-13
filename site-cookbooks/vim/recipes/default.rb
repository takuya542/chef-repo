#
# Cookbook Name:: vim
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

%w{mercurial ncurses-devel}.each do |pkg|
    package pkg do
        action :install
    end
end

bash "install vim7-3" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    ~/dotfiles/Installer/install_vim73.sh
    EOF
    creates "/home/vagrant/vim73"
end
