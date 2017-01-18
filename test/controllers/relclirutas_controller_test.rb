require 'test_helper'

class RelclirutasControllerTest < ActionController::TestCase
  setup do
    @relcliruta = relclirutas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relclirutas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relcliruta" do
    assert_difference('Relcliruta.count') do
      post :create, relcliruta: { IdCliente: @relcliruta.IdCliente, IdEmpresa: @relcliruta.IdEmpresa, IdRuta: @relcliruta.IdRuta }
    end

    assert_redirected_to relcliruta_path(assigns(:relcliruta))
  end

  test "should show relcliruta" do
    get :show, id: @relcliruta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relcliruta
    assert_response :success
  end

  test "should update relcliruta" do
    patch :update, id: @relcliruta, relcliruta: { IdCliente: @relcliruta.IdCliente, IdEmpresa: @relcliruta.IdEmpresa, IdRuta: @relcliruta.IdRuta }
    assert_redirected_to relcliruta_path(assigns(:relcliruta))
  end

  test "should destroy relcliruta" do
    assert_difference('Relcliruta.count', -1) do
      delete :destroy, id: @relcliruta
    end

    assert_redirected_to relclirutas_path
  end
end
