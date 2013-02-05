require 'test_helper'

class CashierSessionsControllerTest < ActionController::TestCase
  setup do
    @cashier_session = cashier_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashier_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cashier_session" do
    assert_difference('CashierSession.count') do
      post :create, cashier_session: @cashier_session.attributes
    end

    assert_redirected_to cashier_session_path(assigns(:cashier_session))
  end

  test "should show cashier_session" do
    get :show, id: @cashier_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cashier_session.to_param
    assert_response :success
  end

  test "should update cashier_session" do
    put :update, id: @cashier_session.to_param, cashier_session: @cashier_session.attributes
    assert_redirected_to cashier_session_path(assigns(:cashier_session))
  end

  test "should destroy cashier_session" do
    assert_difference('CashierSession.count', -1) do
      delete :destroy, id: @cashier_session.to_param
    end

    assert_redirected_to cashier_sessions_path
  end
end
