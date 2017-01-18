require 'test_helper'

class SecrutasControllerTest < ActionController::TestCase
  setup do
    @secruta = secrutas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:secrutas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create secruta" do
    assert_difference('Secruta.count') do
      post :create, secruta: { Domingo: @secruta.Domingo, IdEmpresa: @secruta.IdEmpresa, Jueves: @secruta.Jueves, Lunes: @secruta.Lunes, Martes: @secruta.Martes, Miercoles: @secruta.Miercoles, Rutad: @secruta.Rutad, Sabado: @secruta.Sabado, Viernes: @secruta.Viernes }
    end

    assert_redirected_to secruta_path(assigns(:secruta))
  end

  test "should show secruta" do
    get :show, id: @secruta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @secruta
    assert_response :success
  end

  test "should update secruta" do
    patch :update, id: @secruta, secruta: { Domingo: @secruta.Domingo, IdEmpresa: @secruta.IdEmpresa, Jueves: @secruta.Jueves, Lunes: @secruta.Lunes, Martes: @secruta.Martes, Miercoles: @secruta.Miercoles, Rutad: @secruta.Rutad, Sabado: @secruta.Sabado, Viernes: @secruta.Viernes }
    assert_redirected_to secruta_path(assigns(:secruta))
  end

  test "should destroy secruta" do
    assert_difference('Secruta.count', -1) do
      delete :destroy, id: @secruta
    end

    assert_redirected_to secrutas_path
  end
end
