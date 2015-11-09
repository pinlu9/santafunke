class PresentsController < ApplicationController

  # This is called by the get_presents method in the angular ToyController
  # We delegate .presents to User in order to query efficiently
  def index
    # We know that User.toys correctly selects the toys through presents
    @presents  = current_user.toys
  end

end
