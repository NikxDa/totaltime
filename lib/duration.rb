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

    def self.try_convert(str)
        floatValue = Float(str, exception: false)
        if floatValue
            parsedMinutes = floatValue * 60
            parsedHours = (parsedMinutes / 60).floor
            parsedMinutes = parsedMinutes % 60

            newDuration = Duration.new(parsedHours, parsedMinutes.round)
            return newDuration if newDuration.valid?
        end

        parts=str.split(":")
        
        return unless parts.length == 2
        
        parsedHours = Integer(parts[0], exception: false)
        parsedMinutes = Integer(parts[1], exception: false)

        parsedHours = (parsedMinutes / 60) if parsedHours == nil && parsedMinutes != nil
        return unless parsedHours != nil && parsedMinutes != nil

        parsedMinutes = parsedMinutes % 60
        
        newDuration = Duration.new(parsedHours, parsedMinutes)
        if newDuration.valid? then newDuration else nil end
    end

    def to_s
        formattedHours = @hours.to_s.rjust(2, "0")
        formattedMinutes = @minutes.to_s.rjust(2, "0")
        return "#{formattedHours}:#{formattedMinutes}"
    end
end