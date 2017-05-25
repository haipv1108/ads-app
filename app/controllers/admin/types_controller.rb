module Admin
  class TypesController < AdminController
    before_action :set_type, only: [:show, :edit, :update, :destroy]

    def index
      @types = Type.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @type = Type.new
    end

    def create
      @type = Type.new(type_params)
      if @type.save
        flash[:suceess] = 'Create type was successfully.'
        redirect_to admin_types_path
      else
        render :new
      end
    end

    def show

    end

    def edit

    end

    def update
      if @type.update(type_params)
        flash[:suceess] = 'Update type was successfully.'
        redirect_to admin_types_path
      else
        render :edit
      end
    end

    def destroy
      @type.destroy
      flash[:danger] = 'Deleted type successfully.'
      redirect_to admin_types_path
    end

    private
    def type_params
      params.require(:type).permit(:name)
    end

    def set_type
      @type = Type.find(params[:id])
    end
  end
end
