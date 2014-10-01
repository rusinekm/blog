class EntriesController < ApplicationController
  before_action :article, only: [:show, :edit, :update]
	def index
		@articles = Article.all.order(:date).reverse
	end
  def show
  end
  def edit
  end
  def create
    @article = Article.new(perm_params)
    if article.save
      reditect_to entries_path
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
  def city_params
    params.require(:article).permit(:title, :content)
  end
end
