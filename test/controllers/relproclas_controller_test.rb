require 'test_helper'

class RelproclasControllerTest < ActionController::TestCase
  setup do
    @relprocla = relproclas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relproclas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relprocla" do
    assert_difference('Relprocla.count') do
      post :create, relprocla: { ClasiF: @relprocla.ClasiF, Dep_Clasif: @relprocla.Dep_Clasif, Dep_Nivel: @relprocla.Dep_Nivel, IdEmpresa: @relprocla.IdEmpresa, Nivel: @relprocla.Nivel, ProductoId: @relprocla.ProductoId }
    end

    assert_redirected_to relprocla_path(assigns(:relprocla))
  end

  test "should show relprocla" do
    get :show, id: @relprocla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relprocla
    assert_response :success
  end

  test "should update relprocla" do
    patch :update, id: @relprocla, relprocla: { ClasiF: @relprocla.ClasiF, Dep_Clasif: @relprocla.Dep_Clasif, Dep_Nivel: @relprocla.Dep_Nivel, IdEmpresa: @relprocla.IdEmpresa, Nivel: @relprocla.Nivel, ProductoId: @relprocla.ProductoId }
    assert_redirected_to relprocla_path(assigns(:relprocla))
  end

  test "should destroy relprocla" do
    assert_difference('Relprocla.count', -1) do
      delete :destroy, id: @relprocla
    end

    assert_redirected_to relproclas_path
  end
end
