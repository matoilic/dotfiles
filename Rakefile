require 'rake'
require 'erb'
require 'pathname'

EXCLUDE = %w[Rakefile]
HOME = Pathname.new(ENV['HOME'])

def install_file(file)
  real = real_name(file)
  dest_path = HOME.join(real).to_s
  if file.end_with?('.erb')
    puts "generating ~/#{real}"
    File.open(dest_path, 'w') do |dest_file|
      dest_file.write(ERB.new(File.read(file)).result(binding))
    end
  else
    puts "copying ~~/#{real}"
    system %Q{cp "$PWD/#{file}" "$HOME/#{real}"}
  end
end

def real_name(filename)
  if filename.end_with?('.erb')
    '.' + filename[0...-4]
  else
    '.' + filename
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/#{real_name(file)}"}
  install_file(file)
end

desc "install the dot files in user's home"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if EXCLUDE.include?(file)
    real = real_name(file)
    if File.exists?(HOME.join(real).to_s)
      if replace_all
        replace_file(file)
      else
        puts "overwrite ~/#{real}? [ynaq]"
        case $stdin.gets.chomp
        when 'y'
          replace_file(file)
        when 'a'
          replace_all = true
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/#{real}"
        end
      end
    else
      install_file(file)
    end
  end
end