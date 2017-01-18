require 'test_helper'

class DetallelpControllerTest < ActionController::TestCase
  setup do
    @deta = detallelp(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detallelp)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create deta" do
    assert_difference('Deta.count') do
      post :create, deta: { articulo: @deta.articulo, idempresa: @deta.idempresa, listaid: @deta.listaid, preciomax: @deta.preciomax, preciomin: @deta.preciomin }
    end

    assert_redirected_to deta_path(assigns(:deta))
  end

  test "should show deta" do
    get :show, id: @deta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @deta
    assert_response :success
  end

  test "should update deta" do
    patch :update, id: @deta, deta: { articulo: @deta.articulo, idempresa: @deta.idempresa, listaid: @deta.listaid, preciomax: @deta.preciomax, preciomin: @deta.preciomin }
    assert_redirected_to deta_path(assigns(:deta))
  end

  test "should destroy deta" do
    assert_difference('Deta.count', -1) do
      delete :destroy, id: @deta
    end

    assert_redirected_to detallelp_path
  end
end
