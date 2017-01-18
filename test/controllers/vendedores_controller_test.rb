require 'test_helper'

class VendedoresControllerTest < ActionController::TestCase
  setup do
    @vendedor = vendedores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendedores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendedor" do
    assert_difference('Vendedor.count') do
      post :create, vendedor: { clave: @vendedor.clave, direccion: @vendedor.direccion, metadiaria: @vendedor.metadiaria, metames: @vendedor.metames, movil: @vendedor.movil, nombre: @vendedor.nombre, numlicencia: @vendedor.numlicencia, pdapw: @vendedor.pdapw, status: @vendedor.status, telefono: @vendedor.telefono, vencelic: @vendedor.vencelic }
    end

    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should show vendedor" do
    get :show, id: @vendedor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendedor
    assert_response :success
  end

  test "should update vendedor" do
    patch :update, id: @vendedor, vendedor: { clave: @vendedor.clave, direccion: @vendedor.direccion, metadiaria: @vendedor.metadiaria, metames: @vendedor.metames, movil: @vendedor.movil, nombre: @vendedor.nombre, numlicencia: @vendedor.numlicencia, pdapw: @vendedor.pdapw, status: @vendedor.status, telefono: @vendedor.telefono, vencelic: @vendedor.vencelic }
    assert_redirected_to vendedor_path(assigns(:vendedor))
  end

  test "should destroy vendedor" do
    assert_difference('Vendedor.count', -1) do
      delete :destroy, id: @vendedor
    end

    assert_redirected_to vendedores_path
  end
end
