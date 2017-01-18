require 'test_helper'

class RelclilisControllerTest < ActionController::TestCase
  setup do
    @relclili = relclilis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relclilis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relclili" do
    assert_difference('Relclili.count') do
      post :create, relclili: { codcliente: @relclili.codcliente, idempresa: @relclili.idempresa, listad: @relclili.listad, listap: @relclili.listap, listapromo: @relclili.listapromo }
    end

    assert_redirected_to relclili_path(assigns(:relclili))
  end

  test "should show relclili" do
    get :show, id: @relclili
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relclili
    assert_response :success
  end

  test "should update relclili" do
    patch :update, id: @relclili, relclili: { codcliente: @relclili.codcliente, idempresa: @relclili.idempresa, listad: @relclili.listad, listap: @relclili.listap, listapromo: @relclili.listapromo }
    assert_redirected_to relclili_path(assigns(:relclili))
  end

  test "should destroy relclili" do
    assert_difference('Relclili.count', -1) do
      delete :destroy, id: @relclili
    end

    assert_redirected_to relclilis_path
  end
end
