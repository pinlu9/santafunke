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

  def edit
    # edit judgment
  end

  private

  def judgment_info
    return params.require(:judgment)
            .permit(:child_id, :elf_name, :elf_id, :description, :qualifying_adverb, :naughty)
  end




end
