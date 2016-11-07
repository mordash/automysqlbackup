require 'serverspec'
set :backend, :exec

describe file("/var/lib/automysqlbackup") do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_mode '750' }
end


describe file("/etc/automysqlbackup") do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_mode '755' }
end


describe file("/etc/default/automysqlbackup") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode '644' }
end

describe file("/etc/cron.daily/automysqlbackup") do
  it { should be_file }
  it { should be_owned_by 'root' }
  it { should be_mode '755' }
end