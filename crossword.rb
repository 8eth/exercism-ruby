# Create Crossword cheating tool
# return a list of potential words based on an array of letters
# Use nil to represent unknown letters
# for example, if you only know the first and last letters of the word "HELLO" the array would look like ["H", nil, nil, nil, "O"]
# You can find a list of words at `/usr/share/dict/words`

WORDS = File.read("/usr/share/dict/words").split("\n").map(&:downcase)

def hint(guess)
    WORDS.filter { |word| word.length == guess.length }.filter { |word| 
        all_matched = true

        guess.each_with_index do |letter, index|
            if !letter.nil? && letter != word[index]
                all_matched = false
            end
        end
        all_matched
    }
end

require "minitest/autorun"

class HintTest < Minitest::Test
  def test_starts_with_h_ends_with_o
    assert_equal ["helio", "hello", "hermo"], hint(["h", "e", nil, nil, "o"])
  end

  def test_seven_letters
    assert_equal ["jackpudding", "jawbreaking"], hint(["j", "a", nil, nil, nil, nil, nil, nil, nil, nil, "g"])
  end
end