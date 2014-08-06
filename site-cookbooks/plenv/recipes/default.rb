#
# Cookbook Name:: plenv
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
data_ids = data_bag('users')
data_ids.each do |id|

    u = data_bag_item('users', id)

    bash "plenv install" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        /home/#{id}/dotfiles/Installer/install_plenv.sh
      EOF
      creates "/home/#{id}/.plenv"
    end


    bash "perl new version install" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        source /home/#{id}/.bash_profile
        plenv install 5.16.0
        plenv global 5.16.0
        plenv shell 5.16.0
      EOF
    end


    bash "cpanm install" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        source /home/#{id}/.bash_profile
        plenv install-cpanm
      EOF
    end

end
