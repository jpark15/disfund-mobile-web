class SettingsTypesController < ApplicationController
  before_action :set_settings_type, only: [:show, :edit, :update, :destroy]
  before_action :check_admin, only: [:new, :create, :edit, :show]
  helper_method :sort_column, :sort_direction

  # GET /settings_types
  # GET /settings_types.json
  def index
    @settings_types = SettingsType.order(sort_column + ' ' + sort_direction)
  end

  # GET /settings_types/1
  # GET /settings_types/1.json
  def show
  end

  # GET /settings_types/new
  def new
    @settings_type = SettingsType.new
  end

  # GET /settings_types/1/edit
  def edit
  end

  # POST /settings_types
  # POST /settings_types.json
  def create
    @settings_type = SettingsType.new(settings_type_params)

    respond_to do |format|
      if @settings_type.save
        format.html { redirect_to settings_types_path, notice: 'Settings type was successfully created.' }
        format.json { render :show, status: :created, location: @settings_type }
      else
        format.html { render :new }
        format.json { render json: @settings_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings_types/1
  # PATCH/PUT /settings_types/1.json
  def update
    respond_to do |format|
      if @settings_type.update(settings_type_params)
        format.html { redirect_to settings_types_path, notice: 'Settings type was successfully updated.' }
        format.json { render :show, status: :ok, location: @settings_type }
      else
        format.html { render :edit }
        format.json { render json: @settings_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings_types/1
  # DELETE /settings_types/1.json
  def destroy
    @settings_type.destroy
    respond_to do |format|
      format.html { redirect_to settings_types_url, notice: 'Settings type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sorting
    def sort_column
      SettingsType.column_names.include?(params[:sort]) ? params[:sort] : 'description'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_settings_type
      @settings_type = SettingsType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def settings_type_params
      params.require(:settings_type).permit(:description, :internal_symbol)
    end
end
