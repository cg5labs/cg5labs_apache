hostsfile_entry '192.168.17.1' do
  hostname  'pluto.cg5labs.ddns.net'
  unique    true
end

hostsfile_entry '127.0.0.1' do
  hostname  'localhost'
  aliases   ['localhost.local']
  unique    true
end

hostsfile_entry '10.0.2.15' do
  hostname  node['fqdn']
  unique    true
end

