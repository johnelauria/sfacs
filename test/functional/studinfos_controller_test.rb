require 'test_helper'

class StudinfosControllerTest < ActionController::TestCase
  setup do
    @studinfo = studinfos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:studinfos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create studinfo" do
    assert_difference('Studinfo.count') do
      post :create, studinfo: @studinfo.attributes
    end

    assert_redirected_to studinfo_path(assigns(:studinfo))
  end

  test "should show studinfo" do
    get :show, id: @studinfo.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @studinfo.to_param
    assert_response :success
  end

  test "should update studinfo" do
    put :update, id: @studinfo.to_param, studinfo: @studinfo.attributes
    assert_redirected_to studinfo_path(assigns(:studinfo))
  end

  test "should destroy studinfo" do
    assert_difference('Studinfo.count', -1) do
      delete :destroy, id: @studinfo.to_param
    end

    assert_redirected_to studinfos_path
  end
end
