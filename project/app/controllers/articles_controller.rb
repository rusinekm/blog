class ArticlesController < ApplicationController
  before_action :article, only: [:show, :edit, :update]

  def index
    @articles = Article.all
  end

  def show
  end

  def index_by_tag
    @articles = Article.where(tag: params[:tag_name])
  end

  def edit
  end

  def create
    @article = Article.new(perm_params)
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
  end

  # def destroy
  # end

  def article
    @article ||= Article.find(params[:id])
  end

  def perm_params
    params.require(:article).permit(:title, :content)
  end

  
end
