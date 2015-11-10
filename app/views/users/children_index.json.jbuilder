json.children(@children) do |child|

  json.id child.id
  json.enlisted time_ago_in_words(child.created_at) + " ago"
  json.name child.name
  json.email child.email
  json.age child.age
  json.address child.address

end
