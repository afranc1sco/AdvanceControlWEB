require 'test_helper'

class RelcliclasControllerTest < ActionController::TestCase
  setup do
    @relclicla = relcliclas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:relcliclas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create relclicla" do
    assert_difference('Relclicla.count') do
      post :create, relclicla: { Clas1: @relclicla.Clas1, Clas2: @relclicla.Clas2, Clas3: @relclicla.Clas3, Clas4: @relclicla.Clas4, Clas5: @relclicla.Clas5, IdCliente: @relclicla.IdCliente, IdEmpresa: @relclicla.IdEmpresa }
    end

    assert_redirected_to relclicla_path(assigns(:relclicla))
  end

  test "should show relclicla" do
    get :show, id: @relclicla
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @relclicla
    assert_response :success
  end

  test "should update relclicla" do
    patch :update, id: @relclicla, relclicla: { Clas1: @relclicla.Clas1, Clas2: @relclicla.Clas2, Clas3: @relclicla.Clas3, Clas4: @relclicla.Clas4, Clas5: @relclicla.Clas5, IdCliente: @relclicla.IdCliente, IdEmpresa: @relclicla.IdEmpresa }
    assert_redirected_to relclicla_path(assigns(:relclicla))
  end

  test "should destroy relclicla" do
    assert_difference('Relclicla.count', -1) do
      delete :destroy, id: @relclicla
    end

    assert_redirected_to relcliclas_path
  end
end
