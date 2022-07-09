# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
    nums.each_with_index { |n, i| 
        nums.each_with_index { |n2, i2|
            # puts "comaring #{n} at #{i} with #{n2} at #{i2}"
            if i == i2
                # puts "same index skipping"
                next
            elsif n + n2 == target
                # puts "found #{n} + #{n2} == #{target}"
                return [i, i2]
            end
        }
    }
end

p two_sum([2,7,11,15], 9)
p two_sum([3,2,4], 6)

# Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

# You may assume that each input would have exactly one solution, and you may not use the same element twice.

# You can return the answer in any order.

# Example 1:

# Input: nums = [2,7,11,15], target = 9
# Output: [0,1]
# Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].