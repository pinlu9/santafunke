class Present < ActiveRecord::Base
  belongs_to :child, :class_name => 'User'
  belongs_to :elf, :class_name => 'User'
  belongs_to :toy
end
