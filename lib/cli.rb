require "optparse"
require "tempfile"
require "readline"
require "colorize"

require "duration.rb"

class CLI
    def self.run
        OptionParser.new do |parser| 
            parser.banner = "Usage: totaltime [options]"

            parser.on("-h", "--help", "Show this help message") do ||
                puts parser
                exit
            end
        end.parse!

        puts "Press [Enter] on an empty line to confirm".light_black
        totalDuration = Duration.new

        lineUp = "\033[1A"
        lineClear = "\033[K"

        prompt = "> ".light_black
        promptOverride = lineUp + "\r" + lineClear + prompt

        begin
            while line = Readline.readline(prompt, true)
                if line.empty?
                    print lineUp
                    break
                end

                duration = Duration.try_convert(line)
                
                if duration != nil
                    totalDuration += duration
                    puts promptOverride + duration.to_s.green
                elsif
                    invalidText = (line + " [Invalid]").red
                    puts promptOverride + invalidText
                end
            end
        rescue Interrupt => e
            puts "[Interrupt]".red
        end

        puts "Total time: ".light_black + totalDuration.to_s.cyan
    end
end