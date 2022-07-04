# frozen_string_literal: true

# Use AR to find the customers that made a purchase of over $100 to send a coupon
# for %10 percent off
# for customers that spent over $200, send them a 15% discount code
#
# the message needs to include: shop name, discount ammount and the word thank you.

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem "rails"
  gem "sqlite3"
  gem "faker"
end

require "active_record"
# require "minitest/autorun"
require "logger"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
# ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  create_table :shops, force: true do |t|
    t.string :name
  end

  create_table :purchases, force: true do |t|
    t.integer :shop_id
    t.integer :price # in pennies
    t.integer :customer_id
  end

  create_table :customers, force: true do |t|
    t.string :email
  end
end

class Shop < ActiveRecord::Base
  has_many :purchases
end

class Purchase < ActiveRecord::Base
  belongs_to :shop
  belongs_to :customer
end

class Customer < ActiveRecord::Base
  has_many :purchases
end

# create random dada
100.times do
  Customer.create!(email: Faker::Internet.unique.email)
end

customers = Customer.all.to_a

10.times do
  shop = Shop.create!(name: "#{Faker::ProgrammingLanguage.unique.name} shop")
  300.times do
    shop.purchases.create!(price: rand(100...900_00), customer: customers.sample)
  end
end

# write send_email_method_here
# You don't need to actually send the email,
# just make a string of the body of the email.

def send_email
    # puts Purchase.where('price > 10000').map { |purchase| (purchase.price)/100.0 } # another option

    Customer.all.each do |customer|
        all_purchases_for_customer = customer.purchases.filter do |purchase|

            if (purchase.price)/100.0 > 100.0 && (purchase.price)/100.0 < 200.0
                puts "#{customer.email} #{(purchase.price)/100.0} You have a 10% discount on your purchse from #{purchase.shop.name}. thank you."
            elsif (purchase.price)/100.0 > 200.0
                puts "#{customer.email} #{(purchase.price)/100.0} You have a 15% discount on your purchse from #{purchase.shop.name}. thank you."
            else
                puts "#{(purchase.price)/100.0} no discount"
            end
        end
    end
end

send_email


# class BugTest < Minitest::Test
#   def test_shop_stuff
#     # TODO: write tests here
#   end
# end