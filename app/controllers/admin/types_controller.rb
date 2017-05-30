module Admin
  class TypesController < AdminController
    before_action :set_type, only: [:edit, :update, :destroy]

    def index
      @types = Type.paginate(:page => params[:page], :per_page => 5)
    end

    def new
      @type = Type.new
    end

    def create
      @type = Type.new(type_params)
      respond_to do |format|
        if @type.save
          format.html { redirect_to admin_types_path, notice: 'Create type was successfully.' }
          format.json { render json: @type, status: :created, location: admin_types_path }
        else
          format.html { render :new }
          format.json { render json: @type.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def edit

    end

    def update
      respond_to do |format|
        if @type.update(type_params)
          format.html { redirect_to admin_types_path, notice: 'Update type was successfully.' }
          format.json { render json: @type, status: :ok, location: admin_types_path }
        else
          format.html { render :edit }
          format.json { render json: @type.errors, status: :unprocessable_entity }
        end
        format.js
      end
    end

    def destroy
      @type.destroy
      respond_to do |format|
        format.html { redirect_to admin_types_path }
        format.js
      end
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
