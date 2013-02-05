require 'test_helper'

class MiscellaneousControllerTest < ActionController::TestCase
  setup do
    @miscellaneou = miscellaneous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:miscellaneous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create miscellaneou" do
    assert_difference('Miscellaneou.count') do
      post :create, miscellaneou: @miscellaneou.attributes
    end

    assert_redirected_to miscellaneou_path(assigns(:miscellaneou))
  end

  test "should show miscellaneou" do
    get :show, id: @miscellaneou.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @miscellaneou.to_param
    assert_response :success
  end

  test "should update miscellaneou" do
    put :update, id: @miscellaneou.to_param, miscellaneou: @miscellaneou.attributes
    assert_redirected_to miscellaneou_path(assigns(:miscellaneou))
  end

  test "should destroy miscellaneou" do
    assert_difference('Miscellaneou.count', -1) do
      delete :destroy, id: @miscellaneou.to_param
    end

    assert_redirected_to miscellaneous_path
  end
end
