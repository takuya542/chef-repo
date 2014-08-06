#
# Cookbook Name:: adduser
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute

# 参考：http://girigiribauer.com/archives/1066


group "wheel" do
   gid 10
   action :create
end

# data bagsよりユーザーを作成
data_ids = data_bag('users')

data_ids.each do |id|

    u = data_bag_item('users', id)

    #group作成
    group u['group'] do
        group_name u['group']
        gid u['gid']
        action :create
    end

    # ユーザー作成
    user u['username'] do
        password u['password']
        supports :manage_home => true, :non_unique => false
        group u['group']
        action [:create]
    end

    # ssh公開鍵配置用のディレクトリ作成
    directory "/home/#{id}/.ssh" do
        owner u["id"]
        group u["id"]
        mode 0700
        action :create
    end

    file "/home/#{id}/.ssh/authorized_keys" do
        owner u["id"]
        group u["id"]
        mode 0600
        content u["ssh_key"]
    end

end
