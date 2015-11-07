class JudgmentsController < ApplicationController

  def index
    @judgments = Judgment.all
  end

end
