require 'test_helper'

class ClasproductosControllerTest < ActionController::TestCase
  setup do
    @clasproducto = clasproductos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clasproductos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clasproducto" do
    assert_difference('Clasproducto.count') do
      post :create, clasproducto: { Descripcion: @clasproducto.Descripcion, IdEmpresa: @clasproducto.IdEmpresa, NivelNum: @clasproducto.NivelNum }
    end

    assert_redirected_to clasproducto_path(assigns(:clasproducto))
  end

  test "should show clasproducto" do
    get :show, id: @clasproducto
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clasproducto
    assert_response :success
  end

  test "should update clasproducto" do
    patch :update, id: @clasproducto, clasproducto: { Descripcion: @clasproducto.Descripcion, IdEmpresa: @clasproducto.IdEmpresa, NivelNum: @clasproducto.NivelNum }
    assert_redirected_to clasproducto_path(assigns(:clasproducto))
  end

  test "should destroy clasproducto" do
    assert_difference('Clasproducto.count', -1) do
      delete :destroy, id: @clasproducto
    end

    assert_redirected_to clasproductos_path
  end
end
