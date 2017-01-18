require 'test_helper'

class InventarioControllerTest < ActionController::TestCase
  test "should get producto_negado" do
    get :producto_negado
    assert_response :success
  end

end
