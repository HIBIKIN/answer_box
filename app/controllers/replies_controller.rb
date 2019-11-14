class RepliesController < ApplicationController
  before_action :set_twitter_client
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
      @twitter.update("#{@reply.body}\nテストテスト\n返答のツイート")
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

    def set_twitter_client
      @twitter = Twitter::REST::Client.new do |config|
        config.consumer_key        = "Y2c4X637cQBHfx2IJ6UWVxGtb"
        config.consumer_secret     = "fAlNRrnPx2vJ7EAThpSQpBuj3BePpL5st3KgRYPKIwl2bEM86I"
        config.access_token        = "994147378323013632-p8UxTBBKcsMt46E9nKBZ6HLiNjJ1I5G"
        config.access_token_secret = "FAZn2xSRfLWUCo1C7MBvpFzJ50QD4Eis19VTCIHlmM0Fk"
      end
    end
end
