require "duration.rb"

class TestSimpleNumber < Test::Unit::TestCase
    def test_creation
        dur = Duration.new(1,1)

        assert_instance_of(Duration, dur)
    end

    def test_addition
        dur1 = Duration.new(1,2)
        dur2 = Duration.new(3,4)
        sum = dur1 + dur2

        assert_instance_of(Duration, sum)
        assert_equal(sum.hours, 4)
        assert_equal(sum.minutes, 6)
    end

    def test_wrapping
        dur1 = Duration.new(1,30)
        dur2 = Duration.new(1,31)
        sum = dur1 + dur2

        assert_instance_of(Duration, sum)
        assert_equal(sum.hours, 3)
        assert_equal(sum.minutes, 1)
    end

    def test_string_parse
        parseStr = "1:35"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 1)
        assert_equal(dur.minutes, 35)

        parseStr = "2:90"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 3)
        assert_equal(dur.minutes, 30)

        parseStr = "01:60"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 2)
        assert_equal(dur.minutes, 0)
    end

    def test_colon_parse
        parseStr = ":45"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 0)
        assert_equal(dur.minutes, 45)

        parseStr = ":90"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 1)
        assert_equal(dur.minutes, 30)
    end

    def test_float_parse
        parseStr = "1.5"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 1)
        assert_equal(dur.minutes, 30)

        parseStr = ".5"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 0)
        assert_equal(dur.minutes, 30)

        parseStr = "3.33333333333"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 3)
        assert_equal(dur.minutes, 20)
    end

    def test_invalid_parse
        parseStr = "1.5."
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)

        parseStr = "invalid"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)

        parseStr = ":"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)
    end

    def test_typecheck
        assert_raise(TypeError) {
            Duration.new("a", 2)
        }
    end
end