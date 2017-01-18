require 'test_helper'

class ReldaycliControllerTest < ActionController::TestCase
  setup do
    @reldayc = reldaycli(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reldaycli)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reldayc" do
    assert_difference('Reldayc.count') do
      post :create, reldayc: { CodCli: @reldayc.CodCli, Domingo: @reldayc.Domingo, IdEmpresa: @reldayc.IdEmpresa, Jueves: @reldayc.Jueves, Lunes: @reldayc.Lunes, Martes: @reldayc.Martes, Miercoles: @reldayc.Miercoles, RutaId: @reldayc.RutaId, Sabado: @reldayc.Sabado, Viernes: @reldayc.Viernes }
    end

    assert_redirected_to reldayc_path(assigns(:reldayc))
  end

  test "should show reldayc" do
    get :show, id: @reldayc
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reldayc
    assert_response :success
  end

  test "should update reldayc" do
    patch :update, id: @reldayc, reldayc: { CodCli: @reldayc.CodCli, Domingo: @reldayc.Domingo, IdEmpresa: @reldayc.IdEmpresa, Jueves: @reldayc.Jueves, Lunes: @reldayc.Lunes, Martes: @reldayc.Martes, Miercoles: @reldayc.Miercoles, RutaId: @reldayc.RutaId, Sabado: @reldayc.Sabado, Viernes: @reldayc.Viernes }
    assert_redirected_to reldayc_path(assigns(:reldayc))
  end

  test "should destroy reldayc" do
    assert_difference('Reldayc.count', -1) do
      delete :destroy, id: @reldayc
    end

    assert_redirected_to reldaycli_path
  end
end
