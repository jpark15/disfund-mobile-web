require 'test_helper'

class QuarterlyBudgetsControllerTest < ActionController::TestCase
  setup do
    @quarterly_budget = quarterly_budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quarterly_budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quarterly_budget" do
    assert_difference('QuarterlyBudget.count') do
      post :create, quarterly_budget: { current_balance: @quarterly_budget.current_balance, end_balance: @quarterly_budget.end_balance, quarter: @quarterly_budget.quarter, start_balance: @quarterly_budget.start_balance, year: @quarterly_budget.year }
    end

    assert_redirected_to quarterly_budget_path(assigns(:quarterly_budget))
  end

  test "should show quarterly_budget" do
    get :show, id: @quarterly_budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quarterly_budget
    assert_response :success
  end

  test "should update quarterly_budget" do
    patch :update, id: @quarterly_budget, quarterly_budget: { current_balance: @quarterly_budget.current_balance, end_balance: @quarterly_budget.end_balance, quarter: @quarterly_budget.quarter, start_balance: @quarterly_budget.start_balance, year: @quarterly_budget.year }
    assert_redirected_to quarterly_budget_path(assigns(:quarterly_budget))
  end

  test "should destroy quarterly_budget" do
    assert_difference('QuarterlyBudget.count', -1) do
      delete :destroy, id: @quarterly_budget
    end

    assert_redirected_to quarterly_budgets_path
  end
end
