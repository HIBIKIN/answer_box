class ThemesController < ApplicationController
  require 'uri'
  before_action :set_twitter_client


  def home
  end

  def index
    if logged_in? 
      @themes = Theme.where(user_id: current_user).order(id: "DESC")
    else
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  def new
    if logged_in?
      @theme = Theme.new
    else
      redirect_to root_path, alert: "ログインしてください"
    end
  end

  def create
    if logged_in?
      @theme = Theme.new(theme_params)
      @theme.attributes = {
        user_id: current_user.id
      }
      url = request.url
      # ここでツイートモスルかで条件分岐
      # redirect_to themes_url, notice: "書籍を登録しました。"
      if @theme.save
        @twitter.update("#{@theme.title}\n#{url}/#{@theme.id}")
        redirect_to @theme, notice: "逆質問を作成しました。回答を募集しましょう！"
      else
        render :new
      end
    else
      redirect_to root_path, notice: "ログインしてください"
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @answer = Answer.new
    @answers = Answer.where(theme_id: params[:id])
    @text = URI.encode_www_form_component(@theme.title)
  end

  def destroy
    if logged_in?
      @theme = Theme.find(params[:id])
      @theme.destroy
      redirect_to themes_path, notice: "削除しました。"
    else
      redirect_to root_path, notice: "ログインしてください"
    end
  end

  private

    def theme_params
      params.require(:theme).permit(:title, :description)
    end
end
