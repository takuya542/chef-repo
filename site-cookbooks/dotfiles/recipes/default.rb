#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
#
data_ids = data_bag('users')
data_ids.each do |id|

    u = data_bag_item('users', id)

    git "/home/#{id}/dotfiles" do
      repository "git://github.com/takuya542/dotfiles.git"
      revision "master"
      action :sync
      user  u['id']
      group u['id']
    end

    %w{.bash_alias .bashrc .jshintrc .perltidyrc .proverc .vimrc .vim .tmux .my.conf}.each do |file|
      link "/home/#{id}/#{file}" do
        to "/home/#{id}/dotfiles/#{file}"
      end
    end

    bash "mkdir bundle" do
      user  u['id']
      group u['id']
      cwd "/home/#{id}"
      environment "HOME" => "/home/#{id}"
      code <<-EOF
        mkdir /home/#{id}/.vim/bundle
      EOF
      creates "/home/#{id}/.vim/bundle"
    end

    git "/home/#{id}/.vim/bundle/vundle" do
      repository "git://github.com/gmarik/Vundle.vim.git"
      revision "master"
      action :sync
      user  u['id']
      group u['id']
    end


end
