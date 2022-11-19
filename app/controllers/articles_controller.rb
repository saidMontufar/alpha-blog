class ArticlesController < ApplicationController
  #--> Sets article before the actions mentioned in the square brackets
  #--> This is defined on line 46 under private
  before_action :set_article, only: %i[show edit update destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was created succesfully"
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Article was created succesfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private #--> These functions are exclusve to this controller file

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
