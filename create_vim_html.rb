color_schemes_file = ARGV[0]
source_files       = ARGV[1]

abort "error1" if color_schemes_file.nil?
abort "error2" if source_files.nil?

File.open(color_schemes_file) do |colors|
  colors.each_line do |color|
    vim_options = "+\"syntax on\"+\"set number\"+\"colorscheme #{color.chomp}\""
    File.open(source_files) do |files|
      files.each_line do |file|
        #puts("vim -f #{vim_options} +\"TOhtml\" +\"wq #{file.chomp}.#{color.chomp}.html\" +\"q\" #{file.chomp}")
        system("vim -f #{vim_options} +\"TOhtml\" +\"wq! data/#{file.chomp}.#{color.chomp}.html\" +\"q\" #{file.chomp}")
      end
    end
  end
end
