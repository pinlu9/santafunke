class PresentsController < ApplicationController

  skip_before_action :verify_authenticity_token

  # This is called by the get_presents method in the angular ToyController
  # We delegate .presents to User in order to query efficiently
  def index
    @presents = Present.all
  end

  def mine
    # We know that User.toys correctly selects the toys through presents
    @dummy_presents = current_user.presents
    @dummy_presents.each do |dummy_present|
      # trying to set object variables = to remote data (associated data)
      dummy_present.toy = Toy.find_by_id(dummy_present.toy_id)
      dummy_present.child = Child.find_by_id(dummy_present.child_id)
      if dummy_present.elf_id
        dummy_present.elf = Elf.find_by_id(dummy_present.elf_id)
      end
    end
    @my_presents = @dummy_presents
      #first part in JSON, second part is ActRec Association
  end

  def create
    @present = Present.new(present_info)

    if @present.save
      render json: @present
    else
      render json: {
        error: {
          message: @present.errors.full_messages.to_sentence
        }
      }
    end
  end

  def show
  end

  def edit
    # edit present
  end

  def destroy
    @present = Present.find_by_id(params[:id])
    if @present.destroy
      render json: @present
    else
    end
  end

  private

  def present_info
    return params.require(:present)
            .permit(:child_id, :toy_id, :elf_id)
  end


end
