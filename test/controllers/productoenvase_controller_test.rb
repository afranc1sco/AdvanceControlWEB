require 'test_helper'

class ProductoenvaseControllerTest < ActionController::TestCase
  setup do
    @productoenvas = productoenvase(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productoenvase)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productoenvas" do
    assert_difference('Productoenvas.count') do
      post :create, productoenvas: { Cant_Base: @productoenvas.Cant_Base, Cant_Eq: @productoenvas.Cant_Eq, Envase: @productoenvas.Envase, IdEmpresa: @productoenvas.IdEmpresa, Producto: @productoenvas.Producto, Status: @productoenvas.Status }
    end

    assert_redirected_to productoenvas_path(assigns(:productoenvas))
  end

  test "should show productoenvas" do
    get :show, id: @productoenvas
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productoenvas
    assert_response :success
  end

  test "should update productoenvas" do
    patch :update, id: @productoenvas, productoenvas: { Cant_Base: @productoenvas.Cant_Base, Cant_Eq: @productoenvas.Cant_Eq, Envase: @productoenvas.Envase, IdEmpresa: @productoenvas.IdEmpresa, Producto: @productoenvas.Producto, Status: @productoenvas.Status }
    assert_redirected_to productoenvas_path(assigns(:productoenvas))
  end

  test "should destroy productoenvas" do
    assert_difference('Productoenvas.count', -1) do
      delete :destroy, id: @productoenvas
    end

    assert_redirected_to productoenvase_path
  end
end
