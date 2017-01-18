require 'test_helper'

class ClientesControllerTest < ActionController::TestCase
  setup do
    @cliente = clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cliente" do
    assert_difference('Cliente.count') do
      post :create, cliente: { colonia: @cliente.colonia, cp: @cliente.cp, credito: @cliente.credito, diascreedito: @cliente.diascreedito, direccion: @cliente.direccion, email: @cliente.email, firmaobligada: @cliente.firmaobligada, horario: @cliente.horario, idclasc: @cliente.idclasc, idempresa: @cliente.idempresa, limitecredito: @cliente.limitecredito, motivobajaid: @cliente.motivobajaid, nombre: @cliente.nombre, nombrecorto: @cliente.nombrecorto, referencia: @cliente.referencia, saldo: @cliente.saldo, status: @cliente.status, tel2: @cliente.tel2, telefono: @cliente.telefono, visitaobligada: @cliente.visitaobligada }
    end

    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should show cliente" do
    get :show, id: @cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cliente
    assert_response :success
  end

  test "should update cliente" do
    patch :update, id: @cliente, cliente: { colonia: @cliente.colonia, cp: @cliente.cp, credito: @cliente.credito, diascreedito: @cliente.diascreedito, direccion: @cliente.direccion, email: @cliente.email, firmaobligada: @cliente.firmaobligada, horario: @cliente.horario, idclasc: @cliente.idclasc, idempresa: @cliente.idempresa, limitecredito: @cliente.limitecredito, motivobajaid: @cliente.motivobajaid, nombre: @cliente.nombre, nombrecorto: @cliente.nombrecorto, referencia: @cliente.referencia, saldo: @cliente.saldo, status: @cliente.status, tel2: @cliente.tel2, telefono: @cliente.telefono, visitaobligada: @cliente.visitaobligada }
    assert_redirected_to cliente_path(assigns(:cliente))
  end

  test "should destroy cliente" do
    assert_difference('Cliente.count', -1) do
      delete :destroy, id: @cliente
    end

    assert_redirected_to clientes_path
  end
end
