class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, length: { minimum: 8, allow_nil: true}

  def self.types
    %w(Child Elf)
  end

end

# Every Child has many presents & many judgments Child is a type of user.
# Every Elf creates the judgments for the children (their identity is stored as "elf_id")
# Every Child has many toys through the Presents join table (used to associate toy archetypes with individual children)
