class AnswersController < ApplicationController
  before_action :set_theme, only: [:index, :new, :create]

  def index
    @answers = Answer.find_by(theme_id: params[:theme_id])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.attributes = {
      theme_id: params[:theme_id]
    }
    if @answer.save
      redirect_to @theme, notice: "回答を送りました。"
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @theme = Theme.find(params[:theme_id])
    @replys = Reply.where(answer_id: params[:id])
  end

  private

    def answer_params
      params.require(:answer).permit(:body)
    end

    def set_theme
      @theme = Theme.find(params[:theme_id])
    end
end
