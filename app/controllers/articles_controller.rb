class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # Create a new article
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # Edit an Article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # Delete an Article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  # Methods
  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
