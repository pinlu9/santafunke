# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# Child.create({"name"=>"Jenny Blank", "email"=>"Jenny@ga.com", "password_digest"=>"password", "address"=>"10 delancey St New York, NY 10002", "age"=> "10"})
# Child.create({"name"=>"Adam Lebance", "email"=>"Adam@ga.com", "password_digest"=>"password", "address"=>"20 Adam St Flushing, NY 11302", "age"=> "15"})
# Child.create({"name"=>"Tracy Small", "email"=>"Tracy@ga.com", "password_digest"=>"password", "address"=>"100 Dean St Brooklyn, NY 11216", "age"=> "7"})
# Child.create({"name"=>"Jackie Li", "email"=>"Jackie@ga.com", "password_digest"=>"password", "address"=>"84 Teleance PL Bronx, NY 10302", "age"=> "11"})
#
# Toy.create({"name"=>"Boat", "value"=>"1", "description"=>"Fun"})
# Toy.create({"name"=>"Water Gun", "value"=>"5", "description"=>"Fun"})
# Toy.create({"name"=>"Snowboard", "value"=>"1", "description"=>"Fun"})
# Toy.create({"name"=>"iPhone", "value"=>"1", "description"=>"Apple iPhone"})

# create some children..

10.times do |child|
  child = Child.new
  child.name = Faker::Name.name
  child.email = Faker::Internet.email
  child.password_digest = Faker::Internet.password(8)
  child.address = Faker::Address.street_address
  child.age = Faker::Number.number(2)

  child.save
end

10.times do |elf|
  elf = Elf.new
  elf.name = Faker::Name.name
  elf.email = Faker::Internet.email
  elf.password_digest = Faker::Internet.password(8)
  elf.address = Faker::Address.street_address
  elf.age = Faker::Number.number(2)

  elf.save
end

10.times do |toy|
  toy = Toy.new
  toy.name = Faker::Company.buzzword
  toy.description = Faker::Company.catch_phrase
  toy.value = Faker::Number.number(3)

  toy.save
end

5.times do |present|
  present = Present.new
  present.child_id = Faker::Number.number(1).to_i + 1
  present.elf_id = Faker::Number.number(1).to_i + 1
  present.toy_id = Faker::Number.number(1).to_i + 1

  present.save
end

5.times do |judgment|
  judgment = Judgment.new
  judgment.child_id = Faker::Number.number(1).to_i + 1
  judgment.elf_id = Faker::Number.number(1).to_i + 1
  judgment.description = Faker::Company.catch_phrase
  judgment.naughty = true;
  judgment.qualifying_adverb = Faker::Company.buzzword

  judgment.save
end
