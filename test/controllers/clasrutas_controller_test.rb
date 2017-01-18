require 'test_helper'

class ClasrutasControllerTest < ActionController::TestCase
  setup do
    @clasruta = clasrutas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clasrutas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clasruta" do
    assert_difference('Clasruta.count') do
      post :create, clasruta: { Descripcion: @clasruta.Descripcion, IdCRutas: @clasruta.IdCRutas, NivelNum: @clasruta.NivelNum }
    end

    assert_redirected_to clasruta_path(assigns(:clasruta))
  end

  test "should show clasruta" do
    get :show, id: @clasruta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clasruta
    assert_response :success
  end

  test "should update clasruta" do
    patch :update, id: @clasruta, clasruta: { Descripcion: @clasruta.Descripcion, IdCRutas: @clasruta.IdCRutas, NivelNum: @clasruta.NivelNum }
    assert_redirected_to clasruta_path(assigns(:clasruta))
  end

  test "should destroy clasruta" do
    assert_difference('Clasruta.count', -1) do
      delete :destroy, id: @clasruta
    end

    assert_redirected_to clasrutas_path
  end
end
