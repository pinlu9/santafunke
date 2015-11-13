json.judgments(@judgments) do |judgment|

  json.id judgment.id
  json.child_id judgment.child_id
  json.elf_id judgment.elf_id
  json.description judgment.description
  json.qualifying_adverb judgment.qualifying_adverb
  json.naughty judgment.naughty
  json.created_at time_ago_in_words(judgment.created_at) + " ago"
  json.updated_at time_ago_in_words(judgment.updated_at) + " ago"

end
