class CommentsController < ApplicationController
  before_action :comment, only: [:edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]


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

  def edit
  end

  def new
    @comment = Comment.new
    #@article = Article.find(:id)
  end

  def destroy
    @comment.delete
    redirect_to articles_path
  end

  def update
    if @comment.update(perm_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def perm_params
    params.require(:comment).permit(:title, :content)
  end
end

  def comment
    @comment ||= Comment.find(params[:id])
  end

  def check_admin
    redirect_to articles_path unless current_user && current_user.su
  end