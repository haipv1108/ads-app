module Admin
  class PurposesController < AdminController
    before_action :set_purpose, only: [:edit, :update, :destroy]

    def index
      @purposes = Purpose.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @purpose = Purpose.new
    end

    def create
      @purpose = Purpose.new(purpose_params)
      respond_to do |format|
        if @purpose.save
          format.html { redirect_to admin_purposes_path, notice: 'Create purpose was successfully.' }
          format.json { render json: @purpose, status: :ok, location: admin_purposes_path }
        else
          format.html { render action: 'new' }
          format.json { render json: @purpose.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def edit

    end

    def update
      respond_to do |format|
        if @purpose.update(purpose_params)
          format.html { redirect_to admin_purposes_path, notice: 'Purpose was successfully updated.' }
          format.json { render json: @purpose, status: :ok, location: admin_purposes_path }
        else
          format.html { render :edit }
          format.json { render json: @purpose.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def destroy
      @purpose.destroy
      respond_to do |format|
        format.html { redirect_to admin_purposes_path }
        format.js
      end
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