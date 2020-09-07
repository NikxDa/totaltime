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
        @hours >= 0 && @hours <= 24 && @minutes >= 0 && @minutes <= 60
    end

    def +(duration)
        Duration.new(@hours + duration.hours, @minutes + duration.minutes)
    end

    def self.try_convert(str)
        parts=str.split(":")
        
        return unless parts.length == 2
        
        parsedHours = Integer(parts[0], exception: false)
        parsedMinutes = Integer(parts[1], exception: false)

        return unless parsedHours != nil && parsedMinutes != nil
        
        newDuration = Duration.new(parsedHours, parsedMinutes)
        if newDuration.valid? then newDuration else nil end
    end

    def to_s
        formattedHours = @hours.to_s.rjust(2, "0")
        formattedMinutes = @minutes.to_s.rjust(2, "0")
        return "#{formattedHours}:#{formattedMinutes}"
    end
end