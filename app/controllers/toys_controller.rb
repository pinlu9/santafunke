class ToysController < ApplicationController

  def index
    @toys = Toy.all
  end

  def create
    @toy = Toy.new(toy_info)

    if @toy.save
      render json: @toy
    else
      render json: {
        error: {
          message: @toy.errors.full_messages.to_sentence
        }
      }
    end
  end

  def show
  end

  private

  def toy_info
    return params.require(:toy)
            .permit(:name, :value, :description)
  end

end
