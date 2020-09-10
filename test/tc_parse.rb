require_relative "../lib/duration.rb"

class TestParse < Test::Unit::TestCase
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

        parseStr = "1:"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)
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

    def test_time_parse
        parseStr = "0:00-15:10"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 15)
        assert_equal(dur.minutes, 10)

        parseStr = "22-24"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 2)
        assert_equal(dur.minutes, 0)

        parseStr = "13:40-14:15"
        dur = Duration.try_convert(parseStr)

        assert_not_nil(dur)
        assert_instance_of(Duration, dur)
        assert_equal(dur.hours, 0)
        assert_equal(dur.minutes, 35)
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

        parseStr = "15-13"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)

        parseStr = "15-13"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)

        parseStr = "23-24:01"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)

        parseStr = "-1"
        dur = Duration.try_convert(parseStr)

        assert_nil(dur)
    end
end