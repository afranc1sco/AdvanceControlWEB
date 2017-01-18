require 'test_helper'

class RelmensControllerTest < ActionController::TestCase
  setup do
    @relmen = relmens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relmens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relmen" do
    assert_difference('Relmen.count') do
      post :create, relmen: { CodCliente: @relmen.CodCliente, CodProducto: @relmen.CodProducto, CodRuta: @relmen.CodRuta, IdCliente: @relmen.IdCliente, IdEmpresa: @relmen.IdEmpresa, IdProducto: @relmen.IdProducto, IdRuta: @relmen.IdRuta, MenId: @relmen.MenId }
    end

    assert_redirected_to relmen_path(assigns(:relmen))
  end

  test "should show relmen" do
    get :show, id: @relmen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relmen
    assert_response :success
  end

  test "should update relmen" do
    patch :update, id: @relmen, relmen: { CodCliente: @relmen.CodCliente, CodProducto: @relmen.CodProducto, CodRuta: @relmen.CodRuta, IdCliente: @relmen.IdCliente, IdEmpresa: @relmen.IdEmpresa, IdProducto: @relmen.IdProducto, IdRuta: @relmen.IdRuta, MenId: @relmen.MenId }
    assert_redirected_to relmen_path(assigns(:relmen))
  end

  test "should destroy relmen" do
    assert_difference('Relmen.count', -1) do
      delete :destroy, id: @relmen
    end

    assert_redirected_to relmens_path
  end
end
