require 'test_helper'

class ExpendituresControllerTest < ActionController::TestCase
  setup do
    @expenditure = expenditures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:expenditures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create expenditure" do
    assert_difference('Expenditure.count') do
      post :create, expenditure: { cost: @expenditure.cost, item: @expenditure.item, notes: @expenditure.notes, purchase_date: @expenditure.purchase_date, quarterly_budget_id: @expenditure.quarterly_budget_id, refunded: @expenditure.refunded, type_id: @expenditure.type_id }
    end

    assert_redirected_to expenditure_path(assigns(:expenditure))
  end

  test "should show expenditure" do
    get :show, id: @expenditure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @expenditure
    assert_response :success
  end

  test "should update expenditure" do
    patch :update, id: @expenditure, expenditure: { cost: @expenditure.cost, item: @expenditure.item, notes: @expenditure.notes, purchase_date: @expenditure.purchase_date, quarterly_budget_id: @expenditure.quarterly_budget_id, refunded: @expenditure.refunded, type_id: @expenditure.type_id }
    assert_redirected_to expenditure_path(assigns(:expenditure))
  end

  test "should destroy expenditure" do
    assert_difference('Expenditure.count', -1) do
      delete :destroy, id: @expenditure
    end

    assert_redirected_to expenditures_path
  end
end
