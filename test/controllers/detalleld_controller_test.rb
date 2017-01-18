require 'test_helper'

class DetalleldControllerTest < ActionController::TestCase
  setup do
    @detalle = detalleld(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detalleld)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detalle" do
    assert_difference('Detalle.count') do
      post :create, detalle: { articulo: @detalle.articulo, idempresa: @detalle.idempresa, listaid: @detalle.listaid, tipo: @detalle.tipo }
    end

    assert_redirected_to detalle_path(assigns(:detalle))
  end

  test "should show detalle" do
    get :show, id: @detalle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detalle
    assert_response :success
  end

  test "should update detalle" do
    patch :update, id: @detalle, detalle: { articulo: @detalle.articulo, idempresa: @detalle.idempresa, listaid: @detalle.listaid, tipo: @detalle.tipo }
    assert_redirected_to detalle_path(assigns(:detalle))
  end

  test "should destroy detalle" do
    assert_difference('Detalle.count', -1) do
      delete :destroy, id: @detalle
    end

    assert_redirected_to detalleld_path
  end
end
