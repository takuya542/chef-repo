#
# Cookbook Name:: plenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
bash "plenv install" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    ~/dotfiles/Installer/install_plenv.sh
    EOF
    creates "/home/vagrant/.plenv"
end


bash "perl new version install" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    source ~/.bash_profile
    plenv install 5.16.0
    plenv global 5.16.0
    plenv shell 5.16.0
    EOF
end


bash "cpanm install" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    source ~/.bash_profile
    plenv install-cpanm
    EOF
end


bash "cpan-modules install" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    source ~/.bash_profile
    cpanm < ~/dotfiles/Installer/list_cpan.txt
    EOF
end
