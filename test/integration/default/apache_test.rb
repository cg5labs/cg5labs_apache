# InSpec test for recipe cg5labs_base::apache

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

# check package installed
# https://www.inspec.io/docs/reference/resources/package/
if os.family == 'debian'
  describe package('apache2') do
    it { should be_installed }
  end
end

if os.family == 'redhat'
  describe package('httpd') do
    it { should be_installed }
  end
end

# check firewall ports
# https://www.inspec.io/docs/reference/resources/port/
describe port(80) do
  it { should be_listening }
  if os.family == 'redhat'
      its('processes') {should include 'httpd'}
  end

  if os.family == 'debian'
      its('processes') {should include 'apache2'}
  end

end

# check url
# https://www.inspec.io/docs/reference/resources/http/
describe http('http://10.0.2.15') do
  if os.family == 'redhat'
    its('status') { should cmp 403 }
  end

  if os.family == 'debian'
    its('status') { should cmp 200 }
  end


end
