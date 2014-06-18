class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: [:show, :edit, :update, :destroy]

  # GET /expenditures
  # GET /expenditures.json
  def index
    @expenditures = Expenditure.all
  end

  # GET /expenditures/1
  # GET /expenditures/1.json
  def show
  end

  # GET /expenditures/new
  def new
    load_arrays_for_create

    @expenditure = Expenditure.new
  end

  # GET /expenditures/1/edit
  def edit
    load_arrays_for_create
  end

  # POST /expenditures
  # POST /expenditures.json
  def create
    @expenditure = Expenditure.new(expenditure_params)

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to @expenditure, notice: 'Expenditure was successfully created.' }
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
        format.html { redirect_to @expenditure, notice: 'Expenditure was successfully updated.' }
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
  def load_arrays_for_create
    @quarterly_budgets = QuarterlyBudget.all.map{|budget| [budget.quarteryear, budget.id]}
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
