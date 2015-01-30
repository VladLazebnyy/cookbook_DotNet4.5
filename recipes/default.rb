#
# Cookbook Name:: cookbookDotNet4.5
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform?('windows')
	if win_version.windows_server_2008? || win_version.windows_server_2008_r2?
    if Registry.key_exists?('HKLM\SOFTWARE\Microsoft')
		  Chef::Log.info('Microsoft Framework .NET 4.5 already installed on this platform.')
    else
      windows_package 'Microsoft .NET Framework 4.5' do
        source node 'http://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
        installer_type :custom
        options '/quiet /norestart'
        timeout node 300
        action :install
      end
    end  
  elsif  win_version.windows_server_2012? || win_version.windows_server_2012_r2?
	  windows_feature 'NetFx4Extended-ASPNET45' do
    	action :install
    end
  else
  	Chef::Log.warn('Recipe was design only for Win server 2008 and 2012 .')
  end
else
	Chef::Log.warn('Microsoft Framework .NET 4.5 can only be installed on the Windows platform.')
end