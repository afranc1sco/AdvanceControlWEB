require 'test_helper'

class ListapControllerTest < ActionController::TestCase
  setup do
    @list = listap(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listap)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create list" do
    assert_difference('List.count') do
      post :create, list: { fechafin: @list.fechafin, fechaini: @list.fechaini, idempresa: @list.idempresa, lista: @list.lista, tipo: @list.tipo }
    end

    assert_redirected_to list_path(assigns(:list))
  end

  test "should show list" do
    get :show, id: @list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @list
    assert_response :success
  end

  test "should update list" do
    patch :update, id: @list, list: { fechafin: @list.fechafin, fechaini: @list.fechaini, idempresa: @list.idempresa, lista: @list.lista, tipo: @list.tipo }
    assert_redirected_to list_path(assigns(:list))
  end

  test "should destroy list" do
    assert_difference('List.count', -1) do
      delete :destroy, id: @list
    end

    assert_redirected_to listap_path
  end
end
