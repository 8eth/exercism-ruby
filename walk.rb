WALK = [2, 0, 0, 3, 2, 1, 0, 1, 0, 0, 0, 0, 3, 2, 0, 1, 3, 1, 1, 2, 0, 2, 3, 1, 0, 3, 0, 2, 2, 2, 2, 3, 1, 3, 3, 0, 1, 0, 2, 0, 2, 2, 2, 3, 3, 3, 1, 2, 0, 1, 2, 1, 2, 0, 0, 0, 3, 3, 2, 3, 1, 3, 3, 0, 0, 0, 3, 2, 1, 3, 3, 0, 1, 3, 2, 1, 1, 3, 0, 3, 3, 1, 2, 2, 1, 2, 2, 1, 1, 3, 3, 2, 2, 1, 0, 3, 2, 1, 0, 1]

#          0 - up
# 3 - left +      1 - right
#          2 - down
# a robot is on a random walk indicated by the directions listed above
# assume the robot starts at 0,0 x,y on a 2d grid. find th final x,y location of the robot
# use cartisian coardinates, so up is a bigger number in the y value and right is a bigger number in the x direction.

def do_walk
    x = 0
    y = 0

    WALK.each do |n|
        if n == 0
            y = y + 1
        elsif n == 1
            x = x + 1
        elsif n == 2
            y = y - 1
        elsif n == 3
            x = x - 1
        else
            puts "Error: unexpected number"
        end
    end

    puts "(#{x}, #{y})"

end

do_walk