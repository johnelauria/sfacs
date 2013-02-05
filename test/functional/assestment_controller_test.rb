require 'test_helper'

class AssestmentControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get selection" do
    get :selection
    assert_response :success
  end

  test "should get assestment" do
    get :assestment
    assert_response :success
  end

end
