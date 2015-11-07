json.judgments(@judgments) do |judgment|

  json.child_id judgment.child_id
  json.elf_id judgment.elf_id
  json.json.created_at time_ago_in_words(judgment.created_at) + " ago"

end
