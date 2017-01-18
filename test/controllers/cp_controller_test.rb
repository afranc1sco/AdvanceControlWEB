require 'test_helper'

class CpControllerTest < ActionController::TestCase
  setup do
    @codigopostal = cp(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cp)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create codigopostal" do
    assert_difference('Codigopostal.count') do
      post :create, codigopostal: { CP: @codigopostal.CP, Ciudad: @codigopostal.Ciudad, Colonia: @codigopostal.Colonia, Estado: @codigopostal.Estado, Municipio: @codigopostal.Municipio }
    end

    assert_redirected_to codigopostal_path(assigns(:codigopostal))
  end

  test "should show codigopostal" do
    get :show, id: @codigopostal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @codigopostal
    assert_response :success
  end

  test "should update codigopostal" do
    patch :update, id: @codigopostal, codigopostal: { CP: @codigopostal.CP, Ciudad: @codigopostal.Ciudad, Colonia: @codigopostal.Colonia, Estado: @codigopostal.Estado, Municipio: @codigopostal.Municipio }
    assert_redirected_to codigopostal_path(assigns(:codigopostal))
  end

  test "should destroy codigopostal" do
    assert_difference('Codigopostal.count', -1) do
      delete :destroy, id: @codigopostal
    end

    assert_redirected_to cp_path
  end
end
