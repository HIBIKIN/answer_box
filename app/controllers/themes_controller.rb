class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    if logged_in?
      @theme = Theme.new
    else
      redirect_to root_path, notice: "ログインしてください"
    end
  end

  def create
    @theme = Theme.new(theme_params)
    @theme.attributes = {
      user_id: current_user.id
    }
    # ここでツイートモスルかで条件分岐
    # redirect_to themes_url, notice: "書籍を登録しました。"
    if @theme.save
      redirect_to @theme, notice: "逆質問を作成しました。回答を募集しましょう！"
    else
      render :new
    end
  end

  def show
    @theme = Theme.find(params[:id])
    @answers = Answer.where(theme_id: params[:id])
  end

  def destroy
    @theme = Theme.find(params[:id])
    @theme.destroy
    redirect_to themes_path, notice: "削除しました。"
  end

  private

    def theme_params
      params.require(:theme).permit(:title, :description)
    end
end
