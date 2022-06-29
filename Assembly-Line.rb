class AssemblyLine
    def initialize(speed)
      @speed = speed
    end
  
    def production_rate_per_hour
      @cph = 221
      if @speed <= 4 && @speed >= 1
        @speed * @cph
      elsif @speed <= 8 && @speed >= 5
        @speed * @cph * 0.9
      elsif @speed == 9
        @speed * @cph * 0.8
      else @speed == 10
        @speed * @cph * 0.77
      end
    end
  
    def working_items_per_minute
      (production_rate_per_hour / 60).to_i
    end
end

# Instructions
# In this exercise you'll be writing code to analyze the production of an assembly line in a car factory. The assembly line's speed can range from 0 (off) to 10 (maximum).

# At its slowest speed (1), 221 cars are produced each hour. The production increases linearly with the speed. So with the speed set to 4, it should produce 4 * 221 = 884 cars per hour. However, higher speeds increase the likelihood that faulty cars are produced, which then have to be discarded. The following table shows how speed influences the success rate:

# 1 to 4: 100% success rate.
# 5 to 8: 90% success rate.
# 9: 80% success rate.
# 10: 77% success rate.
# You have two tasks.

# Task 1
# Calculate the production rate per hour

# Implement the AssemblyLine#production_rate_per_hour method to calculate the assembly line's production rate per hour, taking into account its success rate. Note that the value returned is an instance of Float.

# AssemblyLine.new(6).production_rate_per_hour
# #=> 1193.4

# Stuck? Reveal Hints
# Opens in a modal
# Task 2
# Calculate the number of working items produced per minute

# Implement the AssemblyLine#working_items_per_minute method to calculate how many completed, working cars are produced per minute. Note that the value returned is an instance of Integer.

# AssemblyLine.new(6).working_items_per_minute
# #=> 19