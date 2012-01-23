require 'yaml'

class DotParams  
  def get(key, label)
    return @params[key] if @history[key]
    
    input = nil
    while input.nil?
      print((@params[key].nil?) ? "#{label}: " : "#{label} [#{@params[key]}]: ")
      STDOUT.flush
      input = STDIN.gets.chomp
      input = @params[key] if input.length == 0
    end
    
    @params[key] = input
    @history[key] = true
    
    input
  end
  
  def initialize
    @dotfile = File.join(ENV['HOME'], '.dotrc')
    @params = (File.exists?(@dotfile)) ? YAML.load(File.open(@dotfile)) : Hash.new
    @history = Hash.new
  end
  
  def save
    File.open(@dotfile, 'wb') { |f| YAML.dump(@params, f) }
  end
end