class User < ActiveRecord::Base
  has_many :presents
  has_many :judgments
  has_many :toys, through: :presents
end
