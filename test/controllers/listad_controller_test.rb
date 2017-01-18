require 'test_helper'

class ListadControllerTest < ActionController::TestCase
  setup do
    @slista = listad(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:listad)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create slista" do
    assert_difference('Slista.count') do
      post :create, slista: { caduca: @slista.caduca, fechafin: @slista.fechafin, fechaini: @slista.fechaini, idempresa: @slista.idempresa, lista: @slista.lista, tipo: @slista.tipo }
    end

    assert_redirected_to slista_path(assigns(:slista))
  end

  test "should show slista" do
    get :show, id: @slista
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @slista
    assert_response :success
  end

  test "should update slista" do
    patch :update, id: @slista, slista: { caduca: @slista.caduca, fechafin: @slista.fechafin, fechaini: @slista.fechaini, idempresa: @slista.idempresa, lista: @slista.lista, tipo: @slista.tipo }
    assert_redirected_to slista_path(assigns(:slista))
  end

  test "should destroy slista" do
    assert_difference('Slista.count', -1) do
      delete :destroy, id: @slista
    end

    assert_redirected_to listad_path
  end
end
