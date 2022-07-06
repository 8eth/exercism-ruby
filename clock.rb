# Create a class that models a clock.
# calculate the angle in degrees that the clock hand should be.
# remember the minute hand marks the minute exactly, however at half past 3 (3:30), 
# the hour hand is half way between 3 o'clock and 4 o'clock
# top is 0 degrees

require "minitest/autorun"

class Clock

    def initialize(time)
        @time = time
    end

    def minute_angle
        @time.min * 6 # 360 / 60 = 6 (each minute is 6 degrees) 
    end

    def hour_angle
        hour_angle = (@time.hour % 12) * 30 # 360 / 12 = 30 degrees between each number on the clock (one hour)
        minute_angle = (@time.min / 60.0) * 30 # current min / 60 minutes in an hour times 30 degrees in an hour
        hour_angle + minute_angle
    end
    
end

class ClockTest < Minitest::Test
  def test_minute_angle
    noon_clock = Clock.new(Time.new(2022, 10, 31, 12, 0, 0, "-06:00"))
    half_past_three = Clock.new(Time.new(2022, 10, 31, 12, 30, 0, "-06:00"))
    five_till_ten = Clock.new(Time.new(2022, 10, 31, 9, 55, 0, "-06:00"))
    five_past_one = Clock.new(Time.new(2022, 10, 31, 1, 5, 0, "-06:00"))

    assert_equal 0, noon_clock.minute_angle
    assert_equal 180, half_past_three.minute_angle
    assert_equal 330, five_till_ten.minute_angle
    assert_equal 30, five_past_one.minute_angle
  end

  def test_hour_angle
    noon_clock = Clock.new(Time.new(2022, 10, 31, 12, 0, 0, "-06:00"))
    half_past_three = Clock.new(Time.new(2022, 10, 31, 3, 30, 0, "-06:00"))
    five_till_ten = Clock.new(Time.new(2022, 10, 31, 9, 55, 0, "-06:00"))
    five_past_one = Clock.new(Time.new(2022, 10, 31, 1, 5, 0, "-06:00"))

    assert_equal 0, noon_clock.hour_angle
    assert_equal 105.0, half_past_three.hour_angle
    assert_equal 297.5, five_till_ten.hour_angle
    assert_equal 32.5, five_past_one.hour_angle
  end
end