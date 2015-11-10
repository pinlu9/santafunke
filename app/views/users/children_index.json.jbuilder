json.children(@children) do |child|

  json.id child.id
  json.enlisted time_ago_in_words(child.created_at) + " ago"
  json.name child.name
  json.email child.email
  json.age child.age
  json.address child.address
  json.presents(child.presents) do |present|
    json.created_at time_ago_in_words(present.created_at) + " ago"
    json.toy present.toy
    json.elf present.elf
  end

end
