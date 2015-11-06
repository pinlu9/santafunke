class Present < ActiveRecord::Base
  belongs_to :child, :class_name => 'User'
  belongs_to :elf, :class_name => 'User'
  belongs_to :toy
end

# Presents is the JOIN table connecting Child Users, Toys, and Elf Users
# The Child's Wishlist is a series of entries in this table (desired presents)
# A Child defines the toys they want.  Each of these assignments creates a present.
# Elves have the option to "create" toys for the Children, that is why there is space for their id
