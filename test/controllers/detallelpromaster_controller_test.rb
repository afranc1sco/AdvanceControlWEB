require 'test_helper'

class DetallelpromasterControllerTest < ActionController::TestCase
  setup do
    @detallelpromast = detallelpromaster(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:detallelpromaster)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create detallelpromast" do
    assert_difference('Detallelpromast.count') do
      post :create, detallelpromast: { IdEmpresa: @detallelpromast.IdEmpresa, IdLm: @detallelpromast.IdLm, IdPromo: @detallelpromast.IdPromo }
    end

    assert_redirected_to detallelpromast_path(assigns(:detallelpromast))
  end

  test "should show detallelpromast" do
    get :show, id: @detallelpromast
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @detallelpromast
    assert_response :success
  end

  test "should update detallelpromast" do
    patch :update, id: @detallelpromast, detallelpromast: { IdEmpresa: @detallelpromast.IdEmpresa, IdLm: @detallelpromast.IdLm, IdPromo: @detallelpromast.IdPromo }
    assert_redirected_to detallelpromast_path(assigns(:detallelpromast))
  end

  test "should destroy detallelpromast" do
    assert_difference('Detallelpromast.count', -1) do
      delete :destroy, id: @detallelpromast
    end

    assert_redirected_to detallelpromaster_path
  end
end
