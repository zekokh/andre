require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get sessions" do
    get :sessions
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
