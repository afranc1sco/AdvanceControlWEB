require 'test_helper'

class AyudantesControllerTest < ActionController::TestCase
  setup do
    @ayudante = ayudantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ayudantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ayudante" do
    assert_difference('Ayudante.count') do
      post :create, ayudante: { clave: @ayudante.clave, direccion: @ayudante.direccion, nombre: @ayudante.nombre, numlicencia: @ayudante.numlicencia, status: @ayudante.status, telefono: @ayudante.telefono, vencelic: @ayudante.vencelic }
    end

    assert_redirected_to ayudante_path(assigns(:ayudante))
  end

  test "should show ayudante" do
    get :show, id: @ayudante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ayudante
    assert_response :success
  end

  test "should update ayudante" do
    patch :update, id: @ayudante, ayudante: { clave: @ayudante.clave, direccion: @ayudante.direccion, nombre: @ayudante.nombre, numlicencia: @ayudante.numlicencia, status: @ayudante.status, telefono: @ayudante.telefono, vencelic: @ayudante.vencelic }
    assert_redirected_to ayudante_path(assigns(:ayudante))
  end

  test "should destroy ayudante" do
    assert_difference('Ayudante.count', -1) do
      delete :destroy, id: @ayudante
    end

    assert_redirected_to ayudantes_path
  end
end
