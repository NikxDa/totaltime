require "optparse"
require "tempfile"
require "readline"

require "./duration.rb"

OptionParser.new do |parser| 
    parser.banner = "Usage: timesheet [options]"

    parser.on("-h", "--help", "Show this help message") do ||
        puts parser
        exit
    end
end.parse!

puts "Press [Enter] on an empty line to confirm"
totalDuration = Duration.new

while line = Readline.readline("> ", true)
    if line.empty?
        print "\033[1A"
        break
    end
    duration = Duration.try_convert(line)
    totalDuration += duration if duration != nil
end

puts "Total time: #{totalDuration}"