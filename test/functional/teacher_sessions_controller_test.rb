require 'test_helper'

class TeacherSessionsControllerTest < ActionController::TestCase
  setup do
    @teacher_session = teacher_sessions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_session" do
    assert_difference('TeacherSession.count') do
      post :create, teacher_session: @teacher_session.attributes
    end

    assert_redirected_to teacher_session_path(assigns(:teacher_session))
  end

  test "should show teacher_session" do
    get :show, id: @teacher_session.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_session.to_param
    assert_response :success
  end

  test "should update teacher_session" do
    put :update, id: @teacher_session.to_param, teacher_session: @teacher_session.attributes
    assert_redirected_to teacher_session_path(assigns(:teacher_session))
  end

  test "should destroy teacher_session" do
    assert_difference('TeacherSession.count', -1) do
      delete :destroy, id: @teacher_session.to_param
    end

    assert_redirected_to teacher_sessions_path
  end
end
