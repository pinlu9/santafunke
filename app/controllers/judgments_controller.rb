class JudgmentsController < ApplicationController

  skip_before_action :verify_authenticity_token

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
    @judgment = Judgment.find_by_id(params.require(:judgment).permit(:id))
    @judgment.update(judgment_info)
  end

  def destroy
    @judgment = Judgment.find_by_id(params[:id])
    if @judgment.destroy
      render json: @judgment
    else
    end

  end

  private

  def judgment_info
    return params.require(:judgment)
            .permit(:child_id, :elf_name, :elf_id, :description, :qualifying_adverb, :naughty)
  end


end
