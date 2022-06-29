class SimpleCalculator
    ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
    
    class UnsupportedOperation < StandardError
    end
  
    def self.calculate(first_operand, second_operand, operation) # self.calculate('1', 2, '+')
      unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer) 
        raise ArgumentError.new("error")
      end
  
      unless ALLOWED_OPERATIONS.include? operation
        raise UnsupportedOperation.new("error")
      end
  
      if operation == '+' # if '+' == '+'
        "#{first_operand} + #{second_operand} = #{first_operand + second_operand}" # '1' + 2 = 
      elsif operation == '/' && second_operand != 0
        "#{first_operand} / #{second_operand} = #{first_operand / second_operand}"
      elsif operation == '/' && second_operand == 0
        "Division by zero is not allowed."
      elsif operation == '*'
        "#{first_operand} * #{second_operand} = #{first_operand * second_operand}"
      end
    
    end
end



#  Instructions
# In this exercise you will be building error handling for a simple calculator.

# The goal is to have a working calculator that returns a string with the following pattern: 16 + 51 = 67, when provided with arguments 16, 51 and +.

# SimpleCalculator.calculate(16, 51, "+")
# # => "16 + 51 = 67"
# SimpleCalculator.calculate(32, 6, "*")
# # => "32 * 6 = 192"
# SimpleCalculator.calculate(512, 4, "/")
# # => "512 / 4 = 128"
# Task 1
# Handle the code that may raise errors within the method calculate

# The main method for implementation in this task will be the class method SimpleCalculator.calculate() method. It takes three arguments. The first two arguments are numbers on which an operation is going to be conducted. The third argument is of type string and for this exercise it is necessary to implement the following operations:

# addition using the + string
# multiplication using the * string
# division using the / string

# Stuck? Reveal Hints
# Opens in a modal
# Task 2
# Handle illegal operations

# Update the SimpleCalculator.calculate() method to raise an UnsupportedOperation exception for unknown operation symbols.

# SimpleCalculator.calculate(1, 2, '-')
# # => Raises an UnsupportedOperation

# Stuck? Reveal Hints
# Opens in a modal
# Task 3
# Handle invalid arguments

# Update the SimpleCalculator.calculate() method to raise an ArgumentError exception for invalid argument types.

# SimpleCalculator.calculate(1, '2', '*')
# # => Raises an ArgumentError

# Stuck? Reveal Hints
# Opens in a modal
# Task 4
# Handle DivideByZero exceptions

# Update the SimpleCalculator.calculate() to handle ZeroDivisionError exceptions. The handling code should return the string with the content Division by zero is not allowed.. Any other exception should not be handled by the SimpleCalculator.calculate() method.

# SimpleCalculator.calculate(512, 0, "/")
# # => returns "Division by zero is not allowed."