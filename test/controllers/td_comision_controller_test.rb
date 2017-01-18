require 'test_helper'

class TdComisionControllerTest < ActionController::TestCase
  setup do
    @tdcomision = td_comision(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:td_comision)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tdcomision" do
    assert_difference('Tdcomision.count') do
      post :create, tdcomision: { Angente: @tdcomision.Angente, Ayudante: @tdcomision.Ayudante, ID_Comision: @tdcomision.ID_Comision, IdEmpresa: @tdcomision.IdEmpresa, RangoFin: @tdcomision.RangoFin, RangoIni: @tdcomision.RangoIni, Tipo: @tdcomision.Tipo }
    end

    assert_redirected_to tdcomision_path(assigns(:tdcomision))
  end

  test "should show tdcomision" do
    get :show, id: @tdcomision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tdcomision
    assert_response :success
  end

  test "should update tdcomision" do
    patch :update, id: @tdcomision, tdcomision: { Angente: @tdcomision.Angente, Ayudante: @tdcomision.Ayudante, ID_Comision: @tdcomision.ID_Comision, IdEmpresa: @tdcomision.IdEmpresa, RangoFin: @tdcomision.RangoFin, RangoIni: @tdcomision.RangoIni, Tipo: @tdcomision.Tipo }
    assert_redirected_to tdcomision_path(assigns(:tdcomision))
  end

  test "should destroy tdcomision" do
    assert_difference('Tdcomision.count', -1) do
      delete :destroy, id: @tdcomision
    end

    assert_redirected_to td_comision_path
  end
end
