class Toy < ActiveRecord::Base
  has_many :presents
  has_many :users, through: :presents
end

# Toys are entries in a "Toy Catalogue", kind of an archetypal toy
# Many children may want the same toy, so we use the "Presents" join table to assign toys to children
