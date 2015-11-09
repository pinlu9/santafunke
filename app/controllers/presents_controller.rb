class PresentsController < ApplicationController

  # This is called by the get_presents method in the angular ToyController
  # We delegate .presents to User in order to query efficiently
  def index
    # We know that User.toys correctly selects the toys through presents
    @dummy_presents  = current_user.presents
    @dummy_presents.each do |dummy_present|
      # trying to set object variables = to remote data (associated data)
      dummy_present.toy = Toy.find_by_id(dummy_present.toy_id)
      dummy_present.child = Child.find_by_id(dummy_present.child_id)
      if dummy_present.elf_id
        dummy_present.elf = Elf.find_by_id(dummy_present.elf_id)
      end
    end
    @presents = @dummy_presents
      #first part in JSON, second part is ActRec Association
  end

end
