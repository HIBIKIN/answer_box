class ThemesController < ApplicationController

  def index
    @themes = Theme.all
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
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
