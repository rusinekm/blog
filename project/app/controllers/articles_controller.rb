class ArticlesController < ApplicationController
  before_action :article, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:edit, :update, :destroy]

  def index
    @articles = Article.search(params).paginate(:page => params[:page], :per_page => 5)

  end

  def show
  end

  def edit
  end

  def create
    @article = Article.new(perm_params)
    @article.user = current_user
    if article.save
      @article.assign_tags(params[:article][:tag_names])
      redirect_to articles_path
    else
      render :new
    end
  end

  def new
    @article = Article.new
  end

  def update
    if @article.update(perm_params)
      redirect_to articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  def article
    @article ||= Article.find(params[:id])
  end

  def perm_params
    params.require(:article).permit(:title, :content)
  end

  def check_admin
    redirect_to articles_path unless current_user && current_user.su
  end
  
end
