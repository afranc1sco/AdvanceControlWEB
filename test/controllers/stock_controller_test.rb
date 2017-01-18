require 'test_helper'

class StockControllerTest < ActionController::TestCase
  setup do
    @stoc = stock(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stock)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stoc" do
    assert_difference('Stoc.count') do
      post :create, stoc: { Articulo: @stoc.Articulo, IdEmpresa: @stoc.IdEmpresa, Ruta: @stoc.Ruta, Stock: @stoc.Stock }
    end

    assert_redirected_to stoc_path(assigns(:stoc))
  end

  test "should show stoc" do
    get :show, id: @stoc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stoc
    assert_response :success
  end

  test "should update stoc" do
    patch :update, id: @stoc, stoc: { Articulo: @stoc.Articulo, IdEmpresa: @stoc.IdEmpresa, Ruta: @stoc.Ruta, Stock: @stoc.Stock }
    assert_redirected_to stoc_path(assigns(:stoc))
  end

  test "should destroy stoc" do
    assert_difference('Stoc.count', -1) do
      delete :destroy, id: @stoc
    end

    assert_redirected_to stock_path
  end
end
