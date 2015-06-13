require 'logger'
require 'docker'
require 'optparse'

args = {:expire_sec => '7200',
        :vimrc_path => nil,
        :docker_host => 'localhost', 
        :docker_port => '4243',}

OptionParser.new do |opt|
  opt.on('-s=SEC', '--expire-sec', 'default: 7200') { |v| args[:expire_sec] = v }
  opt.on('-p=PATH', '--vimrc-path', 'もし指定しなければvimrcは消しません') { |v| args[:vimrc_path] = v }
  opt.on('-H=HOST', '--docker-host', 'default: localhost') { |v| args[:docker_host] = v }
  opt.on('-P=PORT', '--docker-port', 'default: 4243') { |v| args[:docker_port] = v }
  opt.parse!(ARGV)
end
