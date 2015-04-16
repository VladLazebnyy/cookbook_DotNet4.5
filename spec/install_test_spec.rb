#Check windows version
# 6.3 and 6.2 it's a version of Windows Server 2012 and Windows Server 2012R2
describe windows_registry_key('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion') do
	it { should have_property_value('CurrentVersion',:type_string,'6.3'|| '6.2') }
end
# 6.1 and 6.0 it's a version of Windows Server 2008 and Windows Server 2008R2
describe windows_registry_key('HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion') do
	it { should have_property_value('CurrentVersion',:type_string,'6.1'|| '6.0') }
end
describe file('C:/Windows/Microsoft.NET/Framework/v4.0.30319/Microsoft.Activities.Build.dll') do
	it { should be_file }
end
# this test will be work only with Windows Server 2012
describe windows_feature('NetFx4Extended-ASPNET45') do
  	it{ should be_installed }
end
