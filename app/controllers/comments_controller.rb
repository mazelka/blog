class CommentsController < ApplicationController
  before_action :find_artcile

  def new
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(parent_id: params[:parent_id])
    respond_to do |format|
      format.js
    end
  end

  def create
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def find_artcile
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:text, :parent_id, :article_id)
  end
end
