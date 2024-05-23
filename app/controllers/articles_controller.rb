class ArticlesController < ApplicationController
  # ------- retrive mode --------
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # ------ create mode ----------
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  # ------- update mode ----------
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # ------- delete mode ----------
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # ------ manage paramater --------
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
