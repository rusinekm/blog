class ArticlesController < ApplicationController
  before_action :article, only: [:show, :edit, :update]

  def index
    @articles = Article.all.order(:date)
  end

  def show
  end

  def edit
  end

  def create
    @article = Article.new(perm_params)
    if article.save
      tag_names = params[:article][:tag_names].split(',').map(&:strip)
      tag_names.each do |name|
        temp_tag = create_tag(name)
        Relation.new(tag_id: temp_tag.id, article_id: @article.id).save
      end
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

  def create_tag(name)
    optional_tag =  Tag.find_by(name: name) 
    if optional_tag
      optional_tag
    else
      Tag.new(name: name).tap do |tag|
        tag.save
      end 
    end       
  end
end
