#
# Cookbook Name:: NetFramework
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform?('windows')
	if win_version.windows_server_2008? || win_version.windows_server_2008_r2? || win_version.windows_server_2012? || win_version.windows_server_2012_r2?
		if File.exists?('C:/Windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Activities.Build.dll')
			Chef::Log.info('Microsoft Framework .NET 4.5 already installed on this platform.')
		else
			unless File.exists?('C:/Windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Activities.Build.dll')
				windows_feature 'NetFx4Extended-ASPNET45' do
  					source 'http://www.microsoft.com/en-ie/download/confirmation.aspx?id=42642/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
  					options '/quiet /norestart'
  					installer_type :inno
  					action :install
  				end
  			end
  		end
  	else
  		Chef::Log.warn('Recipe was design only for Win server 2008 and 2012 .')
  	end
  	
else
	Chef::Log.warn('Microsoft Framework .NET 4.5 can only be installed on the Windows platform.')
end