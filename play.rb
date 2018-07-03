require 'optparse'
require_relative 'app'

SIMON_LEVEL_DEFAULT = 1 # ms

def parse_options
  options = {
    difficulty: SIMON_LEVEL_DEFAULT
  }

   optparse = OptionParser.new do |opts|
    opts.banner = 'Simon Says! Repeat the pattern back to Simon'

    opts.on('-h', '-?', '--help', 'Display this screen and exit') do
      puts opts
      exit
    end
  end

  optparse.parse!

  return options
end

begin
  options = parse_options

  new_game = Simon.new(options)
  new_game.play
rescue => e
  puts "Error: #{e}"
end
