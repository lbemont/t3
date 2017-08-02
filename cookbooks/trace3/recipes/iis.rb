#
# Cookbook:: trace3
# Recipe:: iis.rb
#
# Copyright:: 2017, The Authors, All Rights Reserved.

###############
# config fw
###############

windows_firewall_rule 'http' do
  localport '80'
  protocol 'TCP'
  firewall_action :allow
end

###############
# deploy app
###############

cookbook_file "#{Chef::Config[:file_cache_path]}/feather-icons.zip" do
  source 'feather-icons.zip'
end

windows_zipfile "#{node['iis']['pubroot']}" do
  source "#{Chef::Config[:file_cache_path]}/feather-icons.zip"
  action :unzip
  not_if {::File.exists?("#{node['iis']['pubroot']}/node_modules/feather-icons/dist/feather.min.js")}
end

# this was taken from examples just to show js functionality, it aint pretty
cookbook_file "#{node['iis']['pubroot']}/node_modules/feather-icons/index.htm" do
  source 'index.htm'
end

###############
# create site
###############

iis_site 'Default Web Site' do
  action [:stop, :delete]
end

iis_pool 'icons-pool' do
  action :add
end

iis_site 'icons' do
  protocol :http
  port 80
  path "#{node['iis']['pubroot']}/node_modules/feather-icons"
  application_pool 'icons-pool'
  action [:add,:start]
end

