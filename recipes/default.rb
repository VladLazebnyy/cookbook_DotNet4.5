#
# Cookbook Name:: NetFramework
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
if platform?('windows')
	unless File.exists?('C:/Windows/Microsoft.NET/Framework/v4.5')
		windows_package 'Microsoft .NET Framework 4.5.2' do
  			source 'http://www.microsoft.com/en-ie/download/confirmation.aspx?id=42642/NDP452-KB2901907-x86-x64-AllOS-ENU.exe'
  			installer_type :inno
  			action :install
  		end
  	end
else
	Chef::Log.warn('Microsoft Framework .NET 4.5 can only be installed on the Windows platform.')
end