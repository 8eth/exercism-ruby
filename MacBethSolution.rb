# Write a simple webserver which allows you to

# Download MacBeth from here: https://github.com/cs109/2015/blob/master/Lectures/Lecture15b/sparklect/shakes/macbeth.txt
#
# Add the following routes
#
# /characters - List all unique character names in the play
# /lines - take a character as a param and return their first 10 lines

# extra credit:
# /scene - list the scenes with their act from the plays
# /scene - extend scene to take a list of characters and return scenes that contain all of them.

require "bundler/inline"
require 'sinatra'
require "sinatra/reloader"

gemfile(true) do
  source "https://rubygems.org"

  gem "sinatra"
  gem "sinatra-contrib"
  gem "rack-test"
  gem "minitest"
end


get '/' do
  "Hello Bearld"
end

get '/play' do
    File.read('MacBeth.rb')
end

get '/characters' do

  lines = File.read('MacBeth.rb')
  before = true
  lines = lines.split("\n").filter { |line|
      if line.match?("THIS ELECTRONIC VERSION OF THE COMPLETE WORKS OF WILLIAM")
          before = false
      end
      before
  }
  words = lines.join(" ").split(" ")
  # words.inspect
  ends_with_comma = words.filter { |word| word.end_with?(",") }

  names = ends_with_comma.filter { |name| name == name.upcase }
  name = names.map { |name| name.gsub(",", "")}
  name.inspect

end



# Tests

# require 'rack/test'
# require "minitest/autorun"

# class BugTest < Minitest::Test
#   include Rack::Test::Methods

#   def app
#     Sinatra::Application
#   end

#   def test_get_root
#     get '/'
#     assert last_response.ok?
#     assert_equal 'Hello World', last_response.body
#   end
# end