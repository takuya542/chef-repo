#
# Cookbook Name:: dotfiles
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
git "/home/vagrant/dotfiles" do
    repository "git://github.com/takuya542/dotfiles.git"
    revision "master"
    action :sync
    user "vagrant"
    group "vagrant"
end

%w{.bash_alias .bashrc .jshintrc .perltidyrc .proverc .vimrc .vim .tmux .my.conf}.each do |file|
    link "/home/vagrant/#{file}" do
        to "/home/vagrant/dotfiles/#{file}"
    end
end

bash "mkdir bundle" do
    user 'vagrant'
    group 'vagrant'
    cwd '/home/vagrant'
    environment "HOME" => '/home/vagrant'
    code <<-EOF
    mkdir /home/vagrant/.vim/bundle
    EOF
    creates "/home/vagrant/.vim/bundle"
end

git "/home/vagrant/.vim/bundle/vundle" do
    repository "git://github.com/gmarik/Vundle.vim.git"
    revision "master"
    action :sync
    user "vagrant"
    group "vagrant"
end
