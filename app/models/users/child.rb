class Child < User
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 8, allow_nil: true}
  has_many :presents
  has_many :judgments
  has_many :toys, through: :presents
end
