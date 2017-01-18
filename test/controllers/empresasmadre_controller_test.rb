require 'test_helper'

class EmpresasmadreControllerTest < ActionController::TestCase
  setup do
    @empresamadre = empresasmadre(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empresasmadre)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empresamadre" do
    assert_difference('Empresamadre.count') do
      post :create, empresamadre: { Contacto: @empresamadre.Contacto, Direccion: @empresamadre.Direccion, Email: @empresamadre.Email, EmpresaMadre: @empresamadre.EmpresaMadre, RCF: @empresamadre.RCF, Telefono: @empresamadre.Telefono }
    end

    assert_redirected_to empresamadre_path(assigns(:empresamadre))
  end

  test "should show empresamadre" do
    get :show, id: @empresamadre
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empresamadre
    assert_response :success
  end

  test "should update empresamadre" do
    patch :update, id: @empresamadre, empresamadre: { Contacto: @empresamadre.Contacto, Direccion: @empresamadre.Direccion, Email: @empresamadre.Email, EmpresaMadre: @empresamadre.EmpresaMadre, RCF: @empresamadre.RCF, Telefono: @empresamadre.Telefono }
    assert_redirected_to empresamadre_path(assigns(:empresamadre))
  end

  test "should destroy empresamadre" do
    assert_difference('Empresamadre.count', -1) do
      delete :destroy, id: @empresamadre
    end

    assert_redirected_to empresasmadre_path
  end
end
