class HomeController < ApplicationController

  def index
    @articles = Article.all.where(status: true)
  end

  def contact

  end

  def service

  end

  def about

  end
end