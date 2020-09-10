require_relative "../lib/duration.rb"

class TestDuration < Test::Unit::TestCase
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

    def test_typecheck
        assert_raise(TypeError) {
            Duration.new("a", 2)
        }
    end
end