#
# Cookbook Name:: cpanm-module
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
bash "cpan-modules install" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    source ~/.bash_profile
    cpanm App::Ack
    cpanm Mojolicious
    EOF
end
