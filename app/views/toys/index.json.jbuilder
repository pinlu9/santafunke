json.toys(@toys) do |toy|

  json.id toy.id
  json.name toy.name
  json.value toy.value
  json.description toy.description
  json.created_at time_ago_in_words(toy.created_at) + " ago"

end
