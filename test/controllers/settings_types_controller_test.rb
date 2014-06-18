require 'test_helper'

class SettingsTypesControllerTest < ActionController::TestCase
  setup do
    @settings_type = settings_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:settings_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create settings_type" do
    assert_difference('SettingsType.count') do
      post :create, settings_type: { description: @settings_type.description, internal_symbol: @settings_type.internal_symbol }
    end

    assert_redirected_to settings_type_path(assigns(:settings_type))
  end

  test "should show settings_type" do
    get :show, id: @settings_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @settings_type
    assert_response :success
  end

  test "should update settings_type" do
    patch :update, id: @settings_type, settings_type: { description: @settings_type.description, internal_symbol: @settings_type.internal_symbol }
    assert_redirected_to settings_type_path(assigns(:settings_type))
  end

  test "should destroy settings_type" do
    assert_difference('SettingsType.count', -1) do
      delete :destroy, id: @settings_type
    end

    assert_redirected_to settings_types_path
  end
end
