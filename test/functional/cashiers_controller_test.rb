require 'test_helper'

class CashiersControllerTest < ActionController::TestCase
  setup do
    @cashier = cashiers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashiers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cashier" do
    assert_difference('Cashier.count') do
      post :create, cashier: @cashier.attributes
    end

    assert_redirected_to cashier_path(assigns(:cashier))
  end

  test "should show cashier" do
    get :show, id: @cashier.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cashier.to_param
    assert_response :success
  end

  test "should update cashier" do
    put :update, id: @cashier.to_param, cashier: @cashier.attributes
    assert_redirected_to cashier_path(assigns(:cashier))
  end

  test "should destroy cashier" do
    assert_difference('Cashier.count', -1) do
      delete :destroy, id: @cashier.to_param
    end

    assert_redirected_to cashiers_path
  end
end
