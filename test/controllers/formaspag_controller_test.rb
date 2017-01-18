require 'test_helper'

class FormaspagControllerTest < ActionController::TestCase
  setup do
    @formapag = formaspag(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:formaspag)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create formapag" do
    assert_difference('Formapag.count') do
      post :create, formapag: { clave: @formapag.clave, forma: @formapag.forma, status: @formapag.status }
    end

    assert_redirected_to formapag_path(assigns(:formapag))
  end

  test "should show formapag" do
    get :show, id: @formapag
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @formapag
    assert_response :success
  end

  test "should update formapag" do
    patch :update, id: @formapag, formapag: { clave: @formapag.clave, forma: @formapag.forma, status: @formapag.status }
    assert_redirected_to formapag_path(assigns(:formapag))
  end

  test "should destroy formapag" do
    assert_difference('Formapag.count', -1) do
      delete :destroy, id: @formapag
    end

    assert_redirected_to formaspag_path
  end
end
