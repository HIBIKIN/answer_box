class RepliesController < ApplicationController
  before_action :set_answer, only: [:new, :create]

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new(reply_params)
    @reply.attributes = {
      answer_id: params[:answer_id]
    }
    if @reply.save
      redirect_to @answer, notice: "返答を送りました。"
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
end
