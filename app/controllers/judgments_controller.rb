class JudgementsController < ApplicationController

  def index
    @judgments = Judgment.all
  end
end
