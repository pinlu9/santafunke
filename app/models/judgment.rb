class Judgment < ActiveRecord::Base
  belongs_to :child, :class_name => 'User'
  belongs_to :elf, :class_name => 'User'
end

# Judgments reference two separate users.
# an "Elf" user creates a "Judgment" about a "Child"
# The "Elf" is the currently logged-in user whose type is "Elf"
# The "Child" is the user being viewed by the "Elf"
