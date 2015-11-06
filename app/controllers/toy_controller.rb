class ToyController < ApplicationController
  # before_action :require_current_user

  def index
    @toys = Toy.all
  end

  def create
    @toy =
  end
end
