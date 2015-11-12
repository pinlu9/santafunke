json.presents(@my_presents) do |my_present|

  json.id my_present.id
  json.child_id my_present.child_id
  json.elf_id my_present.elf_id
  json.toy_id my_present.toy_id
  json.created_at time_ago_in_words(my_present.created_at) + " ago"
  json.toy my_present.toy

end
