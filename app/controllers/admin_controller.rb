class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_admin

  private
    def correct_admin
      unless current_user.admin?
        flash[:danger] = "Your account does not have access permissions."
        redirect_to root_path
      end
    end
end