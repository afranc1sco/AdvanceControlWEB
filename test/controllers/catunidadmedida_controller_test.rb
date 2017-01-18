require 'test_helper'

class CatunidadmedidaControllerTest < ActionController::TestCase
  setup do
    @catunidadmed = catunidadmedida(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:catunidadmedida)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create catunidadmed" do
    assert_difference('Catunidadmed.count') do
      post :create, catunidadmed: {  }
    end

    assert_redirected_to catunidadmed_path(assigns(:catunidadmed))
  end

  test "should show catunidadmed" do
    get :show, id: @catunidadmed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @catunidadmed
    assert_response :success
  end

  test "should update catunidadmed" do
    patch :update, id: @catunidadmed, catunidadmed: {  }
    assert_redirected_to catunidadmed_path(assigns(:catunidadmed))
  end

  test "should destroy catunidadmed" do
    assert_difference('Catunidadmed.count', -1) do
      delete :destroy, id: @catunidadmed
    end

    assert_redirected_to catunidadmedida_path
  end
end
