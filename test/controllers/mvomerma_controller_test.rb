require 'test_helper'

class MvomermaControllerTest < ActionController::TestCase
  setup do
    @mvmerma = mvomerma(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mvomerma)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mvmerma" do
    assert_difference('Mvmerma.count') do
      post :create, mvmerma: { clave: @mvmerma.clave, merma: @mvmerma.merma, status: @mvmerma.status }
    end

    assert_redirected_to mvmerma_path(assigns(:mvmerma))
  end

  test "should show mvmerma" do
    get :show, id: @mvmerma
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mvmerma
    assert_response :success
  end

  test "should update mvmerma" do
    patch :update, id: @mvmerma, mvmerma: { clave: @mvmerma.clave, merma: @mvmerma.merma, status: @mvmerma.status }
    assert_redirected_to mvmerma_path(assigns(:mvmerma))
  end

  test "should destroy mvmerma" do
    assert_difference('Mvmerma.count', -1) do
      delete :destroy, id: @mvmerma
    end

    assert_redirected_to mvomerma_path
  end
end
