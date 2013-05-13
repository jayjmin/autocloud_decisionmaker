require 'test_helper'

class DecisionControllerTest < ActionController::TestCase
  test "should get find" do
    get :find
    assert_response :success
  end

end
