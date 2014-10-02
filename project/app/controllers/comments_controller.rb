class CommentsController < ApplicationController

 def create
    @comment = Comment.new(perm_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user
    if @comment.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def new
    @comment = Comment.new
    #@article = Article.find(:id)
  end

  def perm_params
    params.require(:comment).permit(:title, :content)
  end
end