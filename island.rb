# calculate how much water this island can hold when it rains
#
#        X   X X    X
#    X X X  XXXX   XXX
# X XX X XX XXXXX XXXXX
# -------------------------

HEIGHTS = [1, 0, 1, 2, 0, 2, 0, 3, 1, 0, 2, 3, 2, 3, 1, 0, 1, 2, 3, 2, 1]

require "minitest/autorun"

class Island
  def initialize(heights)
    @heights = heights
  end

  def water_at(location)
    if @heights.size < 3
        return 0
    end

    left_location_height = @heights[location - 1] 
    location_height = @heights[location]
    right_location_height = @heights[location + 1]

    if left_location_height - right_location_height == 0 && location_height < left_location_height && location_height < right_location_height
        right_location_height - location_height
    else
        x = left_location_height - location_height # 4-3 = 1
        y = right_location_height - location_height # 5-3 = 2   #water is 1
        if x > y
            y
        else
            x
        end
    end
  end

  def total_water
    # TODO: implement this
  end
end

class BugTest < Minitest::Test
    def test_really_small_island
        island = Island.new([1])
        assert_equal 0, island.water_at(0)
    end

    def test_really_small_island_two
        island = Island.new([4])
        assert_equal 0, island.water_at(0)
    end

    def test_water_at_second_position
        # X X
        # XXX
        # XXX
        # XXX
        island = Island.new([4,3,4])
        assert_equal 1, island.water_at(1)
    end

    def test_water_with_unequal_walls
        # X   X
        # XXXXX
        island = Island.new([4,3,5])
        assert_equal 1, island.water_at(1)
    end

#   def test_small_island
# X~X
# --- 
#     island = Island.new([1,0,1])
#     assert_equal 0, island.water_at(0)
#     assert_equal 1, island.water_at(1)
#     assert_equal 0, island.water_at(2)

#     assert_equal 1, island.total_water
#   end

  # TODO: add more tests

#   def test_target_island
#     island = Island.new(HEIGHTS)
#     # TODO: write this test
#   end
end