module Admin
  class PurposesController < AdminController
    before_action :set_purpose, only: [:show, :edit, :update, :destroy]

    def index
      @purposes = Purpose.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @purpose = Purpose.new
    end

    def create
      @purpose = Purpose.new(purpose_params)
      if @purpose.save
        flash[:success] = 'Create purpose was successfully.'
        redirect_to admin_purposes_path
      else
        render :new
      end
    end

    def edit

    end

    def update
      if @purpose.update_attributes(purpose_params)
        flash[:success] = 'Update purpose was successfully.'
        redirect_to admin_purposes_path
      else
        render :edit
      end
    end

    def destroy
      @purpose.destroy
      flash[:danger] = 'Deleted purpose successfully'
      redirect_to admin_purposes_path
    end

    private
      def purpose_params
        params.require(:purpose).permit(:name)
      end

      def set_purpose
        @purpose = Purpose.find(params[:id])
      end
  end
end