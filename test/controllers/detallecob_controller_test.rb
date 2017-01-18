require 'test_helper'

class DetallecobControllerTest < ActionController::TestCase
  setup do
    @detalleco = detallecob(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detallecob)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalleco" do
    assert_difference('Detalleco.count') do
      post :create, detalleco: { Abono: @detalleco.Abono, Cancelada: @detalleco.Cancelada, Cliente: @detalleco.Cliente, DiaO: @detalleco.DiaO, Documento: @detalleco.Documento, Fecha: @detalleco.Fecha, FormaP: @detalleco.FormaP, IdCobranza: @detalleco.IdCobranza, IdEmpresa: @detalleco.IdEmpresa, RutaId: @detalleco.RutaId, Saldo: @detalleco.Saldo, SaldoAnt: @detalleco.SaldoAnt }
    end

    assert_redirected_to detalleco_path(assigns(:detalleco))
  end

  test "should show detalleco" do
    get :show, id: @detalleco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalleco
    assert_response :success
  end

  test "should update detalleco" do
    patch :update, id: @detalleco, detalleco: { Abono: @detalleco.Abono, Cancelada: @detalleco.Cancelada, Cliente: @detalleco.Cliente, DiaO: @detalleco.DiaO, Documento: @detalleco.Documento, Fecha: @detalleco.Fecha, FormaP: @detalleco.FormaP, IdCobranza: @detalleco.IdCobranza, IdEmpresa: @detalleco.IdEmpresa, RutaId: @detalleco.RutaId, Saldo: @detalleco.Saldo, SaldoAnt: @detalleco.SaldoAnt }
    assert_redirected_to detalleco_path(assigns(:detalleco))
  end

  test "should destroy detalleco" do
    assert_difference('Detalleco.count', -1) do
      delete :destroy, id: @detalleco
    end

    assert_redirected_to detallecob_path
  end
end
