class User < ActiveRecord::Base
  has_many :presents
  has_many :judgments
  has_many :toys, through: :presents
end

# Every Child has many presents & many judgments Child is a type of user.
# Every Elf creates the judgments for the children (their identity is stored as "elf_id")
# Every Child has many toys through the Presents join table (used to associate toy archetypes with individual children)
