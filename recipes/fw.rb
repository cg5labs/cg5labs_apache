#
# Cookbook:: cg5labs_base
# Recipe:: fw
#
# Copyright:: 2020, Chris Scheible,  All Rights Reserved.

# FIXME:
# see attributes/default.rb for default firewall toogles (sshd, loopback)

firewall 'default' do
  enabled true
  action :install
end

# open standard ssh port
firewall_rule 'ssh' do
  port     22
  command  :allow
end

