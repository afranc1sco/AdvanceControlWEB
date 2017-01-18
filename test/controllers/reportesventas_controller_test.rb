require 'test_helper'

class ReportesventasControllerTest < ActionController::TestCase
  test "should get noventas" do
    get :noventas
    assert_response :success
  end

end
