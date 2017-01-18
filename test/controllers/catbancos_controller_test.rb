require 'test_helper'

class CatbancosControllerTest < ActionController::TestCase
  setup do
    @catbanco = catbancos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catbancos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catbanco" do
    assert_difference('Catbanco.count') do
      post :create, catbanco: { Clave: @catbanco.Clave, Descripcion: @catbanco.Descripcion, IdEmpresa: @catbanco.IdEmpresa, Status: @catbanco.Status }
    end

    assert_redirected_to catbanco_path(assigns(:catbanco))
  end

  test "should show catbanco" do
    get :show, id: @catbanco
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catbanco
    assert_response :success
  end

  test "should update catbanco" do
    patch :update, id: @catbanco, catbanco: { Clave: @catbanco.Clave, Descripcion: @catbanco.Descripcion, IdEmpresa: @catbanco.IdEmpresa, Status: @catbanco.Status }
    assert_redirected_to catbanco_path(assigns(:catbanco))
  end

  test "should destroy catbanco" do
    assert_difference('Catbanco.count', -1) do
      delete :destroy, id: @catbanco
    end

    assert_redirected_to catbancos_path
  end
end
