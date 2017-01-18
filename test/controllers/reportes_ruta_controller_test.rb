require 'test_helper'

class ReportesRutaControllerTest < ActionController::TestCase
  test "should get recargas" do
    get :recargas
    assert_response :success
  end

end
