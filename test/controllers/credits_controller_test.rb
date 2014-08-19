require 'test_helper'

class CreditsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get change" do
    get :change
    assert_response :success
  end

end
