module Admin
  class CareersController < AdminController
    before_action :set_career, only: [:edit, :update, :destroy]

    def index
      @careers = Career.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @career = Career.new
    end

    def create
      @career = Career.new(career_params)

      respond_to do |format|
        if @career.save
          format.html { redirect_to admin_careers_path, notice: 'Career was successfully created.'}
          format.json { render json: @career, status: :created, location: admin_careers_path }
        else
          format.html { render :new }
          format.json { render json: @career.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def edit

    end

    def update
      respond_to do |format|
        if @career.update(career_params)
          format.html { redirect_to admin_careers_path, notice: 'Career was successfully updated.' }
          format.json { render json: @career, status: :ok, location: admin_careers_path }
        else
          format.html { render :edit }
          format.json { render json: @career.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def destroy
      @career.destroy
      respond_to do |format|
        format.html { redirect_to admin_careers_path }
        format.js
      end
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