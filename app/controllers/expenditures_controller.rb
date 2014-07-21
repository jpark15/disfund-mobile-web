class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: [:show, :edit, :update, :destroy]

  helper_method :sort_column, :sort_direction

  # GET /expenditures
  # GET /expenditures.json
  def index
    @expenditures = Expenditure.order(sort_column + ' ' + sort_direction)
  end

  # GET /expenditures/1
  # GET /expenditures/1.json
  def show
  end

  # GET /expenditures/new
  def new
    load_arrays_for_create
    if params["quarterly_budget_id"]
      @quarterly_budget = QuarterlyBudget.find_by id: params["quarterly_budget_id"]
    end
    @expenditure = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit
    load_arrays_for_create
  end

  # POST /expenditures
  # POST /expenditures.json
  def create
    load_arrays_for_create
    @expenditure = Expenditure.new(expenditure_params)

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to expenditures_path, notice: 'Expenditure was successfully created.' }
        format.json { render :show, status: :created, location: @expenditure }
      else
        format.html { render :new }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenditures/1
  # PATCH/PUT /expenditures/1.json
  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to expenditures_path, notice: 'Expenditure was successfully updated.' }
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1
  # DELETE /expenditures/1.json
  def destroy
    @expenditure.destroy
    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: 'Expenditure was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Sorting
    def sort_column
      Expenditure.column_names.include?(params[:sort]) ? params[:sort] : 'purchase_date'
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def load_arrays_for_create
      @quarterly_budgets = QuarterlyBudget.all.map{|budget| [budget, budget.id]}
      @types = SettingsType.all.map{|type| [type.description, type.id]}
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_expenditure
      @expenditure = Expenditure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expenditure_params
      params.require(:expenditure).permit(:item, :cost, :quarterly_budget_id, :purchase_date, :type_id, :notes, :refunded)
    end
end
