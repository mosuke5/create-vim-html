config_file = ARGV[0]
source_file = ARGV[1]

abort "error1" if config_file.nil?
abort "error2" if source_file.nil?

vim_options = ""
File.open(config_file) do |file|
  file.each_line do |conf|
    next if conf.chomp.empty?
    vim_options += "+\"#{conf.chomp}\""
  end
end

system("vim -f #{vim_options} +\"TOhtml\" +\"wq\" +\"q\" #{source_file}")
