require 'test_helper'

class DetallepromoControllerTest < ActionController::TestCase
  setup do
    @detalleprom = detallepromo(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detallepromo)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalleprom" do
    assert_difference('Detalleprom.count') do
      post :create, detalleprom: { Articulo: @detalleprom.Articulo, Cantidad: @detalleprom.Cantidad, IdEmpresa: @detalleprom.IdEmpresa, Monto: @detalleprom.Monto, Nivel: @detalleprom.Nivel, PromoId: @detalleprom.PromoId, TipMed: @detalleprom.TipMed, Tipo: @detalleprom.Tipo, TipoProm: @detalleprom.TipoProm, Volumen: @detalleprom.Volumen }
    end

    assert_redirected_to detalleprom_path(assigns(:detalleprom))
  end

  test "should show detalleprom" do
    get :show, id: @detalleprom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalleprom
    assert_response :success
  end

  test "should update detalleprom" do
    patch :update, id: @detalleprom, detalleprom: { Articulo: @detalleprom.Articulo, Cantidad: @detalleprom.Cantidad, IdEmpresa: @detalleprom.IdEmpresa, Monto: @detalleprom.Monto, Nivel: @detalleprom.Nivel, PromoId: @detalleprom.PromoId, TipMed: @detalleprom.TipMed, Tipo: @detalleprom.Tipo, TipoProm: @detalleprom.TipoProm, Volumen: @detalleprom.Volumen }
    assert_redirected_to detalleprom_path(assigns(:detalleprom))
  end

  test "should destroy detalleprom" do
    assert_difference('Detalleprom.count', -1) do
      delete :destroy, id: @detalleprom
    end

    assert_redirected_to detallepromo_path
  end
end
