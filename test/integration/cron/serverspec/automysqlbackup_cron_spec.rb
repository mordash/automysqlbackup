require 'serverspec'
set :backend, :exec

describe file("/etc/cron.d/automysqlbackup") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode '644' }
end

if os[:family] == 'debian' || os[:family] == 'ubuntu' then
    describe service ('cron') do
      it { should be_enabled }
      it { should be_running }
    end
elsif os[:family] == 'redhat' then
    describe service ('crond') do
      it { should be_enabled }
      it { should be_running }
    end
end