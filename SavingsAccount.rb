module SavingsAccount
    def self.interest_rate(balance)
        if balance < 0
            -3.213
          elsif balance < 1000
            0.5
          elsif balance < 5000
            1.621
          else balance >= 5000
            2.475
        end

        ####  another option for above
        # case balance
        #     when ...0
        #         then -3.213
        #     when 0...1000
        #         then 0.5
        #     when 1000...5000
        #         then 1.621
        #     when 5000..
        #         then 2.475
        # end
    end
  
    
    def self.annual_balance_update(balance)
      balance + (balance * (interest_rate(balance)/100).abs)
    end
  
    
    def self.years_before_desired_balance(current_balance, desired_balance)
      return if current_balance <= 0
      
      years = 0
      
      while current_balance < desired_balance
        current_balance = annual_balance_update(current_balance)
        years += 1
      end
    years
end

# Instructions
# In this exercise you will be working with savings accounts. Each year, the balance of a savings account is updated based on the interest rate. The interest rate the bank gives depends on the amount of money in the accounts (its balance):

# -3.213% for a negative balance.
# 0.5% for a non-negative balance less than 1000 dollars.
# 1.621% for a positive balance greater or equal than 1000 dollars and less than 5000 dollars.
# 2.475% for a positive balance greater or equal than 5000 dollars.
# You have three tasks, each of which will deal with the balance and its interest rate.

# Task 1
# Calculate the interest rate

# Implement the SavingsAccount.interest_rate method to calculate the interest rate based on the specified balance:

# SavingsAccount.interest_rate(200.75)
# #=> 0.5
# Note that the value returned is an instance of Float.


# Stuck? Reveal Hints
# Opens in a modal
# Task 2
# Calculate the annual balance update

# Implement the SavingsAccount.annual_balance_update method to calculate the annual balance update, taking into account the interest rate:

# SavingsAccount.annual_balance_update(200.75)
# #=> 201.75375
# Note that the value returned is an instance of Float.


# Stuck? Reveal Hints
# Opens in a modal
# Task 3
# Calculate the years before reaching the desired balance

# Implement the SavingsAccount.years_before_desired_balance method to calculate the minimum number of years required to reach the desired balance:

# SavingsAccount.years_before_desired_balance(200.75, 214.88)
# #=> 14
# Note that the value returned is an instance of Integer.


# Stuck? Reveal Hints