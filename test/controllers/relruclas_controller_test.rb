require 'test_helper'

class RelruclasControllerTest < ActionController::TestCase
  setup do
    @relrucla = relruclas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relruclas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relrucla" do
    assert_difference('Relrucla.count') do
      post :create, relrucla: { Clas1: @relrucla.Clas1, Clas2: @relrucla.Clas2, Clas3: @relrucla.Clas3, Clas4: @relrucla.Clas4, Clas5: @relrucla.Clas5, IdEmpresa: @relrucla.IdEmpresa, RutaId: @relrucla.RutaId }
    end

    assert_redirected_to relrucla_path(assigns(:relrucla))
  end

  test "should show relrucla" do
    get :show, id: @relrucla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relrucla
    assert_response :success
  end

  test "should update relrucla" do
    patch :update, id: @relrucla, relrucla: { Clas1: @relrucla.Clas1, Clas2: @relrucla.Clas2, Clas3: @relrucla.Clas3, Clas4: @relrucla.Clas4, Clas5: @relrucla.Clas5, IdEmpresa: @relrucla.IdEmpresa, RutaId: @relrucla.RutaId }
    assert_redirected_to relrucla_path(assigns(:relrucla))
  end

  test "should destroy relrucla" do
    assert_difference('Relrucla.count', -1) do
      delete :destroy, id: @relrucla
    end

    assert_redirected_to relruclas_path
  end
end
