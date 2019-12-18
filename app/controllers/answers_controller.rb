# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :set_theme, only: %i[index new create reply]
  before_action :set_twitter_client
  require 'uri'

  def index
    if logged_in? && current_user == @theme.user
      @answers = Answer.find_by(theme_id: params[:theme_id])
    else
      redirect_to root_path, alert: 'ログインしてください'
    end
  end

  def new; end

  def create
    @answer = Answer.new(answer_params)
    @answer.attributes = {
      theme_id: params[:theme_id]
    }
    if @answer.save
      redirect_to theme_answer_path(id: @answer.id), notice: '回答を送りました。'
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
    @theme = Theme.find(params[:theme_id])
  end

  def reply
    # ここでツイートモスルかで条件分岐
    # redirect_to themes_url, notice: "書籍を登録しました。"
    if logged_in? && current_user == @theme.user
      reply = params[:reply]
      url = request.url
      if  @twitter.update("#{reply}\n#{url}")
        redirect_to request.referrer, notice: 'ツイートされました。'
      else
        redirect_to request.referrer, alert: 'ツイートに失敗しました。'
      end
    else
      redirect_to root_path, alert: 'ログインしてください'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def set_theme
    @theme = Theme.find(params[:theme_id])
  end
end
