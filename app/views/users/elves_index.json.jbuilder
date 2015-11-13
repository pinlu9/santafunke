json.elves(@elves) do |elf|

  json.id elf.id
  json.submitted_to_santas_will time_ago_in_words(elf.created_at) + " ago"
  json.name elf.name
  json.email elf.email
  json.age elf.age
  json.address elf.address

end
