powershell_package_source 'PSGallery' do
  url 'https://www.powershellgallery.com/api/v2'
  action :register
end

powershell_package 'xWebAdministration' do
  version '2.8.0.0'
  action :install
end

directory 'c:\\inetpub\\mywebsite' do
  action :create
end

dsc_resource 'mywebsite' do
  resource :xWebsite
  property :name, 'mywebsite'
  property :physicalpath, 'c:\\inetpub\\mywebsite'
  property :bindinginfo, cim_instance_array(
     'MSFT_xWebBindingInformation',
     Protocol: 'http',
     Port: 81)
  property :logcustomfields, cim_instance_array(
    'MSFT_xLogCustomFieldInformation',
    LogFieldName: 'X-Forwarded-For',
    SourceType: 'RequestHeader',
    SourceName: 'X_FORWARDED_FOR')
  property :state, 'Started'
end
