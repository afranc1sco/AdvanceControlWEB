require 'test_helper'

class CatmarcasControllerTest < ActionController::TestCase
  setup do
    @catmarca = catmarcas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catmarcas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catmarca" do
    assert_difference('Catmarca.count') do
      post :create, catmarca: { Clave: @catmarca.Clave, Descripcion: @catmarca.Descripcion, IdEmpresa: @catmarca.IdEmpresa, Status: @catmarca.Status, TipoMarca: @catmarca.TipoMarca }
    end

    assert_redirected_to catmarca_path(assigns(:catmarca))
  end

  test "should show catmarca" do
    get :show, id: @catmarca
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catmarca
    assert_response :success
  end

  test "should update catmarca" do
    patch :update, id: @catmarca, catmarca: { Clave: @catmarca.Clave, Descripcion: @catmarca.Descripcion, IdEmpresa: @catmarca.IdEmpresa, Status: @catmarca.Status, TipoMarca: @catmarca.TipoMarca }
    assert_redirected_to catmarca_path(assigns(:catmarca))
  end

  test "should destroy catmarca" do
    assert_difference('Catmarca.count', -1) do
      delete :destroy, id: @catmarca
    end

    assert_redirected_to catmarcas_path
  end
end
