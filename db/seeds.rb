# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

def people
    User.create(name:"Bob Black",
                  email: "bob.black@ga.com",
                  type: "Child",
                  toy: "Boat")


    # 20.times do |n|
    #   n = Child.new
    #   n.name = Faker::Name.name
    #   n.email = Faker::Internet.email
    #   n.save
      # city = Faker::AddressUS.city_suffix
      # zipcode  = Faker::AddressUS.zip_code
      # state = Faker::AddressUS.state

      10.times do |n|
          n = Child.create
          n.name = Faker::Name.name
          n.email = Faker::Internet.email
          n.password_digest = "test"
          n.save

    end
  end
