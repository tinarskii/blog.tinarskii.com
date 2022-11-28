class ArticlesController < ApplicationController

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    if @article.save
      redirect_to @article
    else
      flash[:error] = "Oops! Something went wrong. Please try again."
      redirect_to new_article_path
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])

    if @article.author_id != current_user.id
      redirect_to @article, notice: "You do not have permission to edit this article."
    end
  end

  private
  def article_params
    params.require(:article).permit(:title, :body, :tags => [])
  end
end
