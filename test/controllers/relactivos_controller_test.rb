require 'test_helper'

class RelactivosControllerTest < ActionController::TestCase
  setup do
    @relactivo = relactivos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relactivos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relactivo" do
    assert_difference('Relactivo.count') do
      post :create, relactivo: { Activo: @relactivo.Activo, Cliente: @relactivo.Cliente, FechaAsignacion: @relactivo.FechaAsignacion, IdEmpresa: @relactivo.IdEmpresa }
    end

    assert_redirected_to relactivo_path(assigns(:relactivo))
  end

  test "should show relactivo" do
    get :show, id: @relactivo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relactivo
    assert_response :success
  end

  test "should update relactivo" do
    patch :update, id: @relactivo, relactivo: { Activo: @relactivo.Activo, Cliente: @relactivo.Cliente, FechaAsignacion: @relactivo.FechaAsignacion, IdEmpresa: @relactivo.IdEmpresa }
    assert_redirected_to relactivo_path(assigns(:relactivo))
  end

  test "should destroy relactivo" do
    assert_difference('Relactivo.count', -1) do
      delete :destroy, id: @relactivo
    end

    assert_redirected_to relactivos_path
  end
end
