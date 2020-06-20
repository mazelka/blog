class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show destroy]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = 'Article was created'
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @comments = Comment.where(article_id: params[:id])
  end

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated'
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article.destroy
    flash[:notice] = 'Article was deleted'
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end