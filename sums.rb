# take the array of inputs and split them into groups devided by zeros
# take each group and sum the group into a single number.
# return the new list of sums


INPUTS = [9, 6, 1, 6, 9, 10, 5, 9, 3, 8, 7, 7, 6, 7, 8, 0, 0, 4, 5, 10, 4, 8, 6, 2, 2, 7, 9, 6, 6, 0, 1, 2, 2, 9, 7, 6, 3, 6, 6, 1, 0, 6, 5, 9, 5, 2, 3, 2, 0, 8, 10, 3, 3, 5, 3, 8, 10, 4, 7, 10, 3, 1, 8, 1, 10, 2, 0, 6, 2, 3, 9, 5, 4, 9, 7, 7, 2, 10, 4, 3, 8, 0, 5, 3, 3, 3, 3, 3, 4, 3, 8, 1, 0, 1, 1, 4, 8, 3, 6, 1, 1, 3, 7, 8, 8, 7, 1, 4, 3, 1, 9, 0, 4, 8, 5, 0, 0, 7, 7, 4, 4, 3, 7, 10, 2, 1, 7, 2, 3, 1, 2, 6, 3, 8, 2, 5, 1, 1, 6, 8, 4, 9, 1, 5, 5, 7, 2, 8, 3, 2, 7, 6, 10, 5, 10, 10, 5, 3, 7, 7, 2, 2, 10, 0, 9, 8, 7, 6, 4, 4, 2, 7, 0, 7, 7, 2, 3, 0, 9, 10, 8, 2, 0, 8, 0, 9, 0, 7, 6, 8, 9, 3, 4, 5, 5, 7, 0, 0, 6, 3]

def sum_of_inputs(inputs)
    #make an empty array
    arr = []
    current_sum = 0
    #split the array by 0
    #each one need to be in an array
    inputs.each { |input| 
        if input == 0 
            # puts current_sum.inspect
            arr << current_sum
            current_sum = 0
        else 
            #sum each array
            current_sum = current_sum + input
        end
    }

    arr
end

# sum_of_inputs(INPUTS)

require "minitest/autorun"

class SumsTest < Minitest::Test
  def test_inputs_returns_correct_sums
    expected = [101, 0, 69, 43, 32, 96, 79, 36, 76, 17, 0, 230, 47, 19, 29, 8, 9, 54, 0]
    assert_equal expected, sum_of_inputs(INPUTS)
  end
end