require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get login" do
    get :new
    assert_response :success
  end

  # test "should get create" do
  #   get :create
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   get :destroy
  #   assert_response :success
  # end

end
