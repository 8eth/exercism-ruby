# Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

# Symbol       Value
# I             1
# V             5
# X             10
# L             50
# C             100
# D             500
# M             1000
# For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

# Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

# I can be placed before V (5) and X (10) to make 4 and 9. 
# X can be placed before L (50) and C (100) to make 40 and 90. 
# C can be placed before D (500) and M (1000) to make 400 and 900.
# Given a roman numeral, convert it to an integer.

def roman_to_int(s)
    if s.chars.all? { |c| c == "I" }
        s.chars.count
    elsif s == "IV"
        4
    elsif s.start_with?("V")
        5 + roman_to_int(s[1..-1])
    elsif s == "IX"
        9
    elsif s.start_with?("X")
        10 + roman_to_int(s[1..-1])
    else
        0
    end
end

require "minitest/autorun"

class RomanTest < Minitest::Test
  def test_one_two_three
    assert_equal 1, roman_to_int("I")
    assert_equal 2, roman_to_int("II")
    assert_equal 3, roman_to_int("III")
  end

  def test_four
    expected = 4
    assert_equal expected, roman_to_int("IV")
  end

  def test_five
    expected = 5
    assert_equal expected, roman_to_int("V")
  end

  def test_nine
    expected = 9
    assert_equal expected, roman_to_int("IX")
  end

  def test_ten
    expected = 10
    assert_equal expected, roman_to_int("X")
  end

  def test_11_to_18
    assert_equal 11, roman_to_int("XI")
    assert_equal 12, roman_to_int("XII")
    assert_equal 13, roman_to_int("XIII")
    assert_equal 14, roman_to_int("XIV")
    assert_equal 15, roman_to_int("XV")
    assert_equal 16, roman_to_int("XVI")
    assert_equal 17, roman_to_int("XVII")
    assert_equal 18, roman_to_int("XVIII")
  end
end

 

# Example 1:

# Input: s = "III"
# Output: 3
# Explanation: III = 3.