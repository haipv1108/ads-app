module Admin
  class CareersController < AdminController
    before_action :set_career, only: [:show, :edit, :update, :destroy]

    def index
      @careers = Career.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @career = Career.new
    end

    def create
      @career = Career.new(career_params)
      if @career.save
        flash[:success] = 'Create purpose was successfully.'
        redirect_to admin_careers_path
      else
        render :new
      end
    end

    def edit

    end

    def update
      if @career.update_attributes(career_params)
        flash[:success] = 'Update purpose was successfully.'
        redirect_to admin_careers_path
      else
        render :edit
      end
    end

    def destroy
      @career.destroy
      flash[:danger] = 'Deleted purpose successfully'
      redirect_to admin_careers_path
    end

    private
    def career_params
      params.require(:career).permit(:name)
    end

    def set_career
      @career = Career.find(params[:id])
    end
  end
end