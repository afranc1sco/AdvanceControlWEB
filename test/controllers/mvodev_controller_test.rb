require 'test_helper'

class MvodevControllerTest < ActionController::TestCase
  setup do
    @mvodevolucion = mvodev(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mvodev)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mvodevolucion" do
    assert_difference('Mvodevolucion.count') do
      post :create, mvodevolucion: { Clave: @mvodevolucion.Clave, MvoDev: @mvodevolucion.MvoDev, Status: @mvodevolucion.Status }
    end

    assert_redirected_to mvodevolucion_path(assigns(:mvodevolucion))
  end

  test "should show mvodevolucion" do
    get :show, id: @mvodevolucion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mvodevolucion
    assert_response :success
  end

  test "should update mvodevolucion" do
    patch :update, id: @mvodevolucion, mvodevolucion: { Clave: @mvodevolucion.Clave, MvoDev: @mvodevolucion.MvoDev, Status: @mvodevolucion.Status }
    assert_redirected_to mvodevolucion_path(assigns(:mvodevolucion))
  end

  test "should destroy mvodevolucion" do
    assert_difference('Mvodevolucion.count', -1) do
      delete :destroy, id: @mvodevolucion
    end

    assert_redirected_to mvodev_path
  end
end
