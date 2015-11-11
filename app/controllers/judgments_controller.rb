class JudgmentsController < ApplicationController

  def index
    @judgments = Judgment.all
  end

  def create
    @judgment = Judgment.new(judgment_info)

    if @judgment.save
      render json: @judgment
    else
      render json: {
        error: {
          message: @judgment.errors.full_messages.to_sentence
        }
      }
    end
  end

  def show
  end

  private

  def judgment_info
    return params.require(:judgment)
            .permit(:elf_name, :description, :naughty)
  end




end
