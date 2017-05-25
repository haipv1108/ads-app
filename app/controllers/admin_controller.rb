class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_admin

  def index
    @article_approved = Article.all.where(status: true)
    @article_processing = Article.all.where(status: false)
  end

  def approve
    @article = Article.find(params[:id])
    @article.status = true
    if @article.save
      flash[:success] = 'Approved article successfully.'
      redirect_to admin_index_path
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:success] = 'Deleted article successfully.'
    redirect_to admin_index_path
  end

  private
    def correct_admin
      unless current_user.admin?
        flash[:danger] = "Your account does not have access permissions."
        redirect_to root_path
      end
    end
end