class QuarterlyBudgetsController < ApplicationController
  before_action :set_quarterly_budget, only: [:show, :edit, :update, :destroy]

  # GET /quarterly_budgets
  # GET /quarterly_budgets.json
  def index
    @quarterly_budgets = QuarterlyBudget.all
  end

  # GET /quarterly_budgets/1
  # GET /quarterly_budgets/1.json
  def show
    load_arrays_for_create
  end

  # GET /quarterly_budgets/new
  def new
    @quarterly_budget = QuarterlyBudget.new
  end

  # GET /quarterly_budgets/1/edit
  def edit
  end

  # POST /quarterly_budgets
  # POST /quarterly_budgets.json
  def create
    @quarterly_budget = QuarterlyBudget.new(quarterly_budget_params)

    respond_to do |format|
      if @quarterly_budget.save
        format.html { redirect_to @quarterly_budget, notice: 'Quarterly budget was successfully created.' }
        format.json { render :show, status: :created, location: @quarterly_budget }
      else
        format.html { render :new }
        format.json { render json: @quarterly_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quarterly_budgets/1
  # PATCH/PUT /quarterly_budgets/1.json
  def update
    respond_to do |format|
      if @quarterly_budget.update(quarterly_budget_params)
        format.html { redirect_to @quarterly_budget, notice: 'Quarterly budget was successfully updated.' }
        format.json { render :show, status: :ok, location: @quarterly_budget }
      else
        format.html { render :edit }
        format.json { render json: @quarterly_budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quarterly_budgets/1
  # DELETE /quarterly_budgets/1.json
  def destroy
    @quarterly_budget.destroy
    respond_to do |format|
      format.html { redirect_to quarterly_budgets_url, notice: 'Quarterly budget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_arrays_for_create
      @expenditures = @quarterly_budget.expenditures
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_quarterly_budget
      @quarterly_budget = QuarterlyBudget.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quarterly_budget_params
      params.require(:quarterly_budget).permit(:start_balance, :current_balance, :end_balance, :quarter, :year)
    end
end
