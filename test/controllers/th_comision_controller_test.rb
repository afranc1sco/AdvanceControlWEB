require 'test_helper'

class ThComisionControllerTest < ActionController::TestCase
  setup do
    @comision = th_comision(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:th_comision)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comision" do
    assert_difference('Comision.count') do
      post :create, comision: { comentarios: @comision.comentarios, id_producto: @comision.id_producto, idempresa: @comision.idempresa, status: @comision.status }
    end

    assert_redirected_to comision_path(assigns(:comision))
  end

  test "should show comision" do
    get :show, id: @comision
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comision
    assert_response :success
  end

  test "should update comision" do
    patch :update, id: @comision, comision: { comentarios: @comision.comentarios, id_producto: @comision.id_producto, idempresa: @comision.idempresa, status: @comision.status }
    assert_redirected_to comision_path(assigns(:comision))
  end

  test "should destroy comision" do
    assert_difference('Comision.count', -1) do
      delete :destroy, id: @comision
    end

    assert_redirected_to th_comision_path
  end
end
