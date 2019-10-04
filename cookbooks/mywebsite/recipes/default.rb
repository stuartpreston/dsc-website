dsc_resource 'Install IIS' do
  resource :windowsfeature
  property :name, 'web-server'
end

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
  property :bindinginfo,  cim_instance_array_helper(
    [
      cim_instance(
        'MSFT_xWebBindingInformation',
        Protocol: 'http',
        Port: 81),
    ])
  property :logcustomfields, cim_instance_array_helper(
    [
      cim_instance(
        'MSFT_xLogCustomFieldInformation',
        LogFieldName: 'X-Forwarded-For',
        SourceType: 'RequestHeader',
        SourceName: 'X_FORWARDED_FOR'
      ),
      cim_instance(
        'MSFT_xLogCustomFieldInformation',
        LogFieldName: 'True-Client-IP',
        SourceType: 'RequestHeader',
        SourceName: 'True-Client-IP'
      ),
    ])
  property :state, 'Started'
  # The below is not working yet - it looks like the correct format (passes validation)
  # but perhaps other properties needs setting too?
  #
  # property :LogFlags, %w(Date Time)
end
