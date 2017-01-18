require 'test_helper'

class VentaControllerTest < ActionController::TestCase
  test "should get venta" do
    get :venta
    assert_response :success
  end

end
