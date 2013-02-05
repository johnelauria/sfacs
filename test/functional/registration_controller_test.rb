require 'test_helper'

class RegistrationControllerTest < ActionController::TestCase
  test "should get register" do
    get :register
    assert_response :success
  end

  test "should get catcher" do
    get :catcher
    assert_response :success
  end

end
