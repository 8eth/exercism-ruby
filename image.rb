# Use the image class to complete the challenges listed at the bottom.

class Image
    attr_reader :width, :height
    def initialize(width, height)
      @width = width
      @height = height
      @data = Array.new(width)
      width.times do |w|
        @data[w] = Array.new(height)
        height.times do |h|
          @data[w][h] = [0, 0, 0]
        end
      end
    end
  
    def at(x, y)
      if x < width && y < height
        @data[x][y]
      else
        [0,0,0]
      end
    end
  
    def each_pixel(&block)
      @width.times do |x|
        @height.times do |y|
          @data[x][y] = yield [x, y, @data[x][y]]
        end
      end
    end
  
    def save(filename)
      File.open(filename, 'w') do |f|
        f.puts "P6", "#{@width} #{@height}", "255"
        f.binmode
        @height.times do |y|
          @width.times do |x|
            f.print @data[x][y].pack('C3')
          end
        end
      end
    end
    alias_method :write, :save
  
    def self.load(filename)
      s = nil
      File.open(filename, 'r') do |f|
        p6 = f.readline
        size = f.readline.split(" ").map(&:to_i)
        width = size[0]
        height = size[1]
  
        s = self.new(width, height)
  
        depth = f.readline
  
        f.binmode
  
        raw_colors =  f.each_byte.each_slice(3).to_a
        s.each_pixel do |x, y, _|
          raw_colors[y * width + x]
        end
      end
      s
    end
end
  
# Make a image file where the green value is the x position and the blue value is the y position
small_image = Image.new(100, 100)
small_image.each_pixel do |x, y, rgb|
    rgb[0] = x + y
    rgb
end
small_image.save("image_red.ppm")

# remove all the red from the image
stop = Image.load("image_stop_1.ppm")
stop.each_pixel do |x, y, rgb|
    rgb[0] = 0
    rgb
end
stop.save("image_no_red_stop.ppm")

# invert the image
stop = Image.load("image_stop_1.ppm")
stop.each_pixel do |x, y, rgb|
    rgb[0] = rgb[0] ^ 255
    rgb[1] = rgb[1] ^ 255
    rgb[2] = rgb[2] ^ 255
    # rgb[0] = rgb[1]
    # rgb[1] = rgb[2]
    # rgb[2] = rgb[0]
    rgb
end
stop.save("image_inverted_stop.ppm")

# Downsample the image
# create a image half the size by making a smaller image that uses every other pixel