require 'test_helper'

class ListapromomasterControllerTest < ActionController::TestCase
  setup do
    @listapromomast = listapromomaster(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listapromomaster)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create listapromomast" do
    assert_difference('Listapromomast.count') do
      post :create, listapromomast: { Id: @listapromomast.Id, IdEmpresa: @listapromomast.IdEmpresa, ListaMaster: @listapromomast.ListaMaster, Promociones: @listapromomast.Promociones }
    end

    assert_redirected_to listapromomast_path(assigns(:listapromomast))
  end

  test "should show listapromomast" do
    get :show, id: @listapromomast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @listapromomast
    assert_response :success
  end

  test "should update listapromomast" do
    patch :update, id: @listapromomast, listapromomast: { Id: @listapromomast.Id, IdEmpresa: @listapromomast.IdEmpresa, ListaMaster: @listapromomast.ListaMaster, Promociones: @listapromomast.Promociones }
    assert_redirected_to listapromomast_path(assigns(:listapromomast))
  end

  test "should destroy listapromomast" do
    assert_difference('Listapromomast.count', -1) do
      delete :destroy, id: @listapromomast
    end

    assert_redirected_to listapromomaster_path
  end
end
