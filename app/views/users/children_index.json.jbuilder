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
  json.judgments(child.judgments) do |judgment|
    json.id judgment.id
    json.judgment_child_id judgment.child_id
    json.elf_name judgment.elf_name
    json.description judgment.description
    json.qualifying_adverb judgment.qualifying_adverb
    json.naughty judgment.naughty
    json.created_at time_ago_in_words(judgment.created_at) + " ago"
    json.updated_at time_ago_in_words(judgment.updated_at) + " ago"
  end

end
