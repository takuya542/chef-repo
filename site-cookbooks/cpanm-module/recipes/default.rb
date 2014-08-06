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
    user 'onda'
    group 'onda'
    cwd '/home/onda'
    environment "HOME" => '/home/onda'
    code <<-EOF
    source ~/.bash_profile
    cpanm App::Ack
    cpanm Mojolicious
    EOF
end
