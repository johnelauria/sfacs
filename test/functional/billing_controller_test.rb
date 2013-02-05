require 'test_helper'

class BillingControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get studentcatcher" do
    get :studentcatcher
    assert_response :success
  end

  test "should get viewassestment" do
    get :viewassestment
    assert_response :success
  end

  test "should get viewtransaction" do
    get :viewtransaction
    assert_response :success
  end

  test "should get assestmentcatcher" do
    get :assestmentcatcher
    assert_response :success
  end

  test "should get paymentcatcher" do
    get :paymentcatcher
    assert_response :success
  end

  test "should get paytuition" do
    get :paytuition
    assert_response :success
  end

  test "should get enrollmentcatcher" do
    get :enrollmentcatcher
    assert_response :success
  end

  test "should get viewregform" do
    get :viewregform
    assert_response :success
  end

  test "should get viewenrollmentreceipt" do
    get :viewenrollmentreceipt
    assert_response :success
  end

  test "should get viewpaymentreceipt" do
    get :viewpaymentreceipt
    assert_response :success
  end

end
