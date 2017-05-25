class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :preview]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if current_user&.admin
      @article.status = true;
    end
    if @article.save
      flash[:success] = 'Add ads was successfully. Please wait for admin to check before posting to the homepage.'
      redirect_to preview_article_path(@article)
    else
      render :new
    end
  end

  def show

  end

  def preview

  end

  private
    def article_params
      params.require(:article).permit(:fanpage, :link, :description, :type_id, career_ids: [], purpose_ids: [])
    end
    def set_article
      @article = Article.find(params[:id])
    end
end