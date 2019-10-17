class RepliesController < ApplicationController
  before_action :set_answer, only: [:new, :create]
  before_action :set_theme, only: [:new, :create]


  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.attributes = {
      answer_id: params[:answer_id]
    }
    if @reply.save
      redirect_to "/themes/#{@answer.theme_id}/answers/#{@answer.id}", notice: "返答を送りました。"
    else
      render :new
    end
  end

  private

    def reply_params
      params.require(:reply).permit(:body)
    end

    def set_answer
      @answer = Answer.find(params[:answer_id])
    end

    def set_theme
      @theme = Theme.find(@answer.theme_id)
    end
end
