if current_user
  json.current_user do
    json.id current_user.id
    json.email current_user.email
    json.name current_user.name
    json.age current_user.age
    json.type current_user.type
    json.address current_user.address
    json.joined_santas_army time_ago_in_words(current_user.created_at) + " ago"
  end
end
