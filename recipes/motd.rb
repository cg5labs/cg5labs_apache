#
# Cookbook:: cg5labs_base
# Recipe:: motd
#
# Copyright:: 2020, Chris Scheible, All Rights Reserved.

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
end

