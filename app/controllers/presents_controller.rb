class PresentsController < ApplicationController

  def index
    @presents = Present.all
  end
  
end
