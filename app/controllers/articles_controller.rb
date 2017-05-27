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

  def search
    query_sql = "SELECT articles.* FROM articles"
    where = " WHERE ((fanpage LIKE '#{params[:keyword]}') OR (description LIKE '%#{params[:keyword]}%'))"
    unless params[:type_id].empty?
      query_sql += " INNER JOIN types ON types.id = articles.type_id"
      where += " AND types.id = #{params[:type_id].to_i}"
    end
    unless params[:career_id].empty?
      query_sql += " INNER JOIN article_careers ON article_careers.article_id = articles.id INNER JOIN careers ON careers.id = article_careers.career_id"
      where += " AND careers.id = #{params[:career_id]}"
    end

    unless params[:purpose_id].empty?
      query_sql += " INNER JOIN article_purposes ON article_purposes.article_id = articles.id INNER JOIN purposes ON purposes.id = article_purposes.purpose_id"
      where += " AND purposes.id = #{params[:purpose_id]}"
    end
    query = query_sql + where
    @articles = Article.find_by_sql(query)
  end

  private
    def article_params
      params.require(:article).permit(:fanpage, :link, :description, :type_id, career_ids: [], purpose_ids: [])
    end
    def set_article
      @article = Article.find(params[:id])
    end
end