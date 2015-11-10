json.users(@users) do |user|

  json.id user.id
  json.signed_up time_ago_in_words(user.created_at) + " ago"
  json.name user.name
  json.email user.email
  json.type user.type
  json.age user.age
  json.address user.address

end
