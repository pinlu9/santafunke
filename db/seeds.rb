# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Child.create({"name"=>"Jenny Blank", "email"=>"Jenny@ga.com", "password_digest"=>"password", "address"=>"10 delancey St New York, NY 10002", "age"=> "10"})
Child.create({"name"=>"Adam Lebance", "email"=>"Adam@ga.com", "password_digest"=>"password", "address"=>"20 Adam St Flushing, NY 11302", "age"=> "15"})
Child.create({"name"=>"Tracy Small", "email"=>"Tracy@ga.com", "password_digest"=>"password", "address"=>"100 Dean St Brooklyn, NY 11216", "age"=> "7"})
Child.create({"name"=>"Jackie Li", "email"=>"Jackie@ga.com", "password_digest"=>"password", "address"=>"84 Teleance PL Bronx, NY 10302", "age"=> "11"})

Toy.create({"name"=>"Boat", "value"=>"1", "description"=>"Fun"})
Toy.create({"name"=>"Water Gun", "value"=>"5", "description"=>"Fun"})
Toy.create({"name"=>"Snowboard", "value"=>"1", "description"=>"Fun"})
Toy.create({"name"=>"iPhone", "value"=>"1", "description"=>"Apple iPhone"})
