require 'test_helper'

class CobranzaControllerTest < ActionController::TestCase
  setup do
    @cobran = cobranza(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cobranza)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cobran" do
    assert_difference('Cobran.count') do
      post :create, cobran: { Cliente: @cobran.Cliente, DiaO: @cobran.DiaO, Documento: @cobran.Documento, FechaPag: @cobran.FechaPag, FechaVence: @cobran.FechaVence, FolioInterno: @cobran.FolioInterno, IdEmpresa: @cobran.IdEmpresa, RutaId: @cobran.RutaId, Saldo: @cobran.Saldo, Status: @cobran.Status, TipoDoc: @cobran.TipoDoc, UltPago: @cobran.UltPago }
    end

    assert_redirected_to cobran_path(assigns(:cobran))
  end

  test "should show cobran" do
    get :show, id: @cobran
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cobran
    assert_response :success
  end

  test "should update cobran" do
    patch :update, id: @cobran, cobran: { Cliente: @cobran.Cliente, DiaO: @cobran.DiaO, Documento: @cobran.Documento, FechaPag: @cobran.FechaPag, FechaVence: @cobran.FechaVence, FolioInterno: @cobran.FolioInterno, IdEmpresa: @cobran.IdEmpresa, RutaId: @cobran.RutaId, Saldo: @cobran.Saldo, Status: @cobran.Status, TipoDoc: @cobran.TipoDoc, UltPago: @cobran.UltPago }
    assert_redirected_to cobran_path(assigns(:cobran))
  end

  test "should destroy cobran" do
    assert_difference('Cobran.count', -1) do
      delete :destroy, id: @cobran
    end

    assert_redirected_to cobranza_path
  end
end
