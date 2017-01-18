require 'test_helper'

class ListapromoControllerTest < ActionController::TestCase
  setup do
    @listaprom = listapromo(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listapromo)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listaprom" do
    assert_difference('Listaprom.count') do
      post :create, listaprom: { Activa: @listaprom.Activa, Caduca: @listaprom.Caduca, Descripcion: @listaprom.Descripcion, FechaF: @listaprom.FechaF, FechaI: @listaprom.FechaI, Grupo: @listaprom.Grupo, IdEmpresa: @listaprom.IdEmpresa, Lista: @listaprom.Lista, Tipo: @listaprom.Tipo }
    end

    assert_redirected_to listaprom_path(assigns(:listaprom))
  end

  test "should show listaprom" do
    get :show, id: @listaprom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listaprom
    assert_response :success
  end

  test "should update listaprom" do
    patch :update, id: @listaprom, listaprom: { Activa: @listaprom.Activa, Caduca: @listaprom.Caduca, Descripcion: @listaprom.Descripcion, FechaF: @listaprom.FechaF, FechaI: @listaprom.FechaI, Grupo: @listaprom.Grupo, IdEmpresa: @listaprom.IdEmpresa, Lista: @listaprom.Lista, Tipo: @listaprom.Tipo }
    assert_redirected_to listaprom_path(assigns(:listaprom))
  end

  test "should destroy listaprom" do
    assert_difference('Listaprom.count', -1) do
      delete :destroy, id: @listaprom
    end

    assert_redirected_to listapromo_path
  end
end
