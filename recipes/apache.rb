#
# Cookbook:: cg5labs_base
# Recipe:: apache.rb
#
# Copyright:: 2020, Chris Scheible, All Rights Reserved.

package 'Install Apache' do
  action :install
  only_if { node['install_package'] }
  case node[:platform]
    when 'redhat', 'centos'
      package_name node['package']['rhel']['apache']
    when 'ubuntu', 'debian'
      package_name node['package']['debian']['apache']
  end
end

service 'apache' do
  if redhat? or centos?
    service_name 'httpd'
  else
    service_name 'apache2'
  end
  action [:enable, :start]
end

# open multiple ports for http/https, note that the protocol
# attribute is required when using ports
firewall_rule 'http/https' do
  protocol :tcp
  port     [80, 443]
  command   :allow
end

