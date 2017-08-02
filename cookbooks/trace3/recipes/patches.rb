#
# Cookbook:: trace3
# Recipe:: patches.rb
#
# Copyright:: 2017, The Authors, All Rights Reserved.

powershell_module "PSWindowsUpdate" do
  package_name "PSWindowsUpdate"
  source node['patches']['PSWindowsUpdate']['url']
end

powershell_script 'install patches' do
  timeout 14400
  code <<-EOH
    Import-Module PSWindowsUpdate
    Add-WUServiceManager -ServiceID #{node['patches']['PSWindowsUpdate']['serviceid']} -Confirm:$false
    Get-WUInstall -MicrosoftUpdate -AcceptAll -AutoReboot
  EOH
end

