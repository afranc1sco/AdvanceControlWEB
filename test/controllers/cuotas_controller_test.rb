require 'test_helper'

class CuotasControllerTest < ActionController::TestCase
  setup do
    @cuota = cuotas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuotas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cuota" do
    assert_difference('Cuota.count') do
      post :create, cuota: { Activa: @cuota.Activa, Cantidad: @cuota.Cantidad, Clave: @cuota.Clave, Descripcion: @cuota.Descripcion, FechaF: @cuota.FechaF, FechaI: @cuota.FechaI, IdEmpresa: @cuota.IdEmpresa, NivelNum: @cuota.NivelNum, Producto: @cuota.Producto, Tipo: @cuota.Tipo, UniMed: @cuota.UniMed }
    end

    assert_redirected_to cuota_path(assigns(:cuota))
  end

  test "should show cuota" do
    get :show, id: @cuota
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cuota
    assert_response :success
  end

  test "should update cuota" do
    patch :update, id: @cuota, cuota: { Activa: @cuota.Activa, Cantidad: @cuota.Cantidad, Clave: @cuota.Clave, Descripcion: @cuota.Descripcion, FechaF: @cuota.FechaF, FechaI: @cuota.FechaI, IdEmpresa: @cuota.IdEmpresa, NivelNum: @cuota.NivelNum, Producto: @cuota.Producto, Tipo: @cuota.Tipo, UniMed: @cuota.UniMed }
    assert_redirected_to cuota_path(assigns(:cuota))
  end

  test "should destroy cuota" do
    assert_difference('Cuota.count', -1) do
      delete :destroy, id: @cuota
    end

    assert_redirected_to cuotas_path
  end
end
