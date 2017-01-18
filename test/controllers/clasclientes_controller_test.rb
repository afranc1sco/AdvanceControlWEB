require 'test_helper'

class ClasclientesControllerTest < ActionController::TestCase
  setup do
    @clascliente = clasclientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clasclientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create clascliente" do
    assert_difference('Clascliente.count') do
      post :create, clascliente: { Descripcion: @clascliente.Descripcion, IdClasC: @clascliente.IdClasC, NivelNum: @clascliente.NivelNum }
    end

    assert_redirected_to clascliente_path(assigns(:clascliente))
  end

  test "should show clascliente" do
    get :show, id: @clascliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @clascliente
    assert_response :success
  end

  test "should update clascliente" do
    patch :update, id: @clascliente, clascliente: { Descripcion: @clascliente.Descripcion, IdClasC: @clascliente.IdClasC, NivelNum: @clascliente.NivelNum }
    assert_redirected_to clascliente_path(assigns(:clascliente))
  end

  test "should destroy clascliente" do
    assert_difference('Clascliente.count', -1) do
      delete :destroy, id: @clascliente
    end

    assert_redirected_to clasclientes_path
  end
end
