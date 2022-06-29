class Attendee
    def initialize(height)
      @height = height
    end
  
    def issue_pass!(pass_id)
      @pass_id = pass_id
    end
  
    def revoke_pass!
      @pass_id = nil
    end
  
    # Do not edit above methods, add your own methods below.
  
    #Implement the Attendee#has_pass? method to return a boolean (true/false) value based on the presence of a ride pass.

    def has_pass?
      @pass_id ? true : false
    end

    #Implement the Attendee#fits_ride? method to see if an attendee fits a ride based on their height. The ride's required minimum height is provided as an argument. An attendee must have height greater than or equal to ride's required minimum height.
  
    def fits_ride?(ride_minimum_height)
      @height >= ride_minimum_height ? true : false
    end
  
    #Implement the Attendee#allowed_to_ride? method to see if an attendee is allowed to go on a ride. The ride's required minimum height is provided as an argument. An attendee must have a ride pass and be able to fit the ride.
    def allowed_to_ride?(ride_minimum_height)
      has_pass? && fits_ride?(ride_minimum_height)
    end
  end