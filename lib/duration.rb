require "time"

class Duration
    attr_accessor :hours, :minutes

    def initialize(hours=0, minutes=0)
        unless hours.is_a?(Integer) && minutes.is_a?(Integer)
            raise TypeError.new("Duration expects integer parameters.")
        end

        @hours=hours
        @minutes=minutes
    end

    def valid?
        @hours >= 0 && @minutes >= 0 && @minutes <= 59
    end

    def +(duration)
        newMinutes = (@minutes + duration.minutes) % 60
        newHours = @hours + duration.hours + (@minutes + duration.minutes) / 60
        Duration.new(newHours, newMinutes)
    end

    def total_minutes()
        return @hours * 60 + @minutes
    end

    def self.try_convert(str)
        floatValue = Float(str, exception: false)
        if floatValue
            parsedMinutes = floatValue * 60
            parsedHours = (parsedMinutes / 60).floor
            parsedMinutes = parsedMinutes % 60

            newDuration = Duration.new(parsedHours, parsedMinutes.round)
            return newDuration if newDuration.valid?
        end

        if str.include?("-")
            times = str.split("-")
            times.map! { |t|  t + (t.include?(":") ? "" : ":00") }

            begin
                startTime = Time.parse(times[0])
                endTime = Time.parse(times[1])
            rescue 
                return
            end

            minutesBetween = Integer((endTime - startTime) / 60, exception: false)
            return unless minutesBetween != nil

            parsedHours = minutesBetween / 60
            parsedMinutes = minutesBetween % 60

            newDuration = Duration.new(parsedHours, parsedMinutes)
            if newDuration.valid? then newDuration else nil end
        else
            parts=str.split(":")
            return unless parts.length == 2
    
            parsedHours = Integer(parts[0], exception: false)
            parsedMinutes = Integer(parts[1], exception: false)
    
            return if parsedMinutes == nil
            parsedHours = 0 if parsedHours == nil
            parsedHours = parsedHours + (parsedMinutes / 60)
    
            parsedMinutes = parsedMinutes % 60
            
            newDuration = Duration.new(parsedHours, parsedMinutes)
            if newDuration.valid? then newDuration else nil end
        end
    end

    def self.from_minutes(mins)
        newMinutes = mins % 60
        newHours = mins / 60
        Duration.new(newHours, newMinutes)
    end

    def to_s
        formattedHours = @hours.to_s.rjust(2, "0")
        formattedMinutes = @minutes.to_s.rjust(2, "0")
        return "#{formattedHours}:#{formattedMinutes}"
    end
end