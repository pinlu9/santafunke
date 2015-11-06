class Toy < ActiveRecord::Base
  has_many :presents
  has_many :users, through: :presents
end
