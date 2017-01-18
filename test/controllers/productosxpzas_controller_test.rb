require 'test_helper'

class ProductosxpzasControllerTest < ActionController::TestCase
  setup do
    @productosxpza = productosxpzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productosxpzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create productosxpza" do
    assert_difference('Productosxpza.count') do
      post :create, productosxpza: { idempresa: @productosxpza.idempresa, producto: @productosxpza.producto, pzaxcja: @productosxpza.pzaxcja }
    end

    assert_redirected_to productosxpza_path(assigns(:productosxpza))
  end

  test "should show productosxpza" do
    get :show, id: @productosxpza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @productosxpza
    assert_response :success
  end

  test "should update productosxpza" do
    patch :update, id: @productosxpza, productosxpza: { idempresa: @productosxpza.idempresa, producto: @productosxpza.producto, pzaxcja: @productosxpza.pzaxcja }
    assert_redirected_to productosxpza_path(assigns(:productosxpza))
  end

  test "should destroy productosxpza" do
    assert_difference('Productosxpza.count', -1) do
      delete :destroy, id: @productosxpza
    end

    assert_redirected_to productosxpzas_path
  end
end
