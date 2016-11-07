require 'serverspec'
set :backend, :exec

if os[:family] == 'debian' || os[:family] == 'ubuntu' then
    describe file("/var/lib/automysqlbackup") do
      it { should be_directory }
      it { should be_owned_by 'root' }
      it { should be_mode '750' }
    end
end

describe file("/etc/automysqlbackup") do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_mode '755' }
end

if os[:family] == 'debian' || os[:family] == 'ubuntu' then
    describe file("/etc/default/automysqlbackup") do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_mode '644' }
    end
end

if os[:family] == 'redhat' then
    describe file("/etc/automysqlbackup/myserver.conf") do
      it { should be_file }
      it { should be_owned_by 'root' }
      it { should be_mode '750' }
    end
end

