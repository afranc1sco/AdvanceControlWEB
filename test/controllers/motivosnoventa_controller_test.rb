require 'test_helper'

class MotivosnoventaControllerTest < ActionController::TestCase
  setup do
    @motivonoventa = motivosnoventa(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motivosnoventa)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motivonoventa" do
    assert_difference('Motivonoventa.count') do
      post :create, motivonoventa: { clave: @motivonoventa.clave, motivo: @motivonoventa.motivo, status: @motivonoventa.status }
    end

    assert_redirected_to motivonoventa_path(assigns(:motivonoventa))
  end

  test "should show motivonoventa" do
    get :show, id: @motivonoventa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motivonoventa
    assert_response :success
  end

  test "should update motivonoventa" do
    patch :update, id: @motivonoventa, motivonoventa: { clave: @motivonoventa.clave, motivo: @motivonoventa.motivo, status: @motivonoventa.status }
    assert_redirected_to motivonoventa_path(assigns(:motivonoventa))
  end

  test "should destroy motivonoventa" do
    assert_difference('Motivonoventa.count', -1) do
      delete :destroy, id: @motivonoventa
    end

    assert_redirected_to motivosnoventa_path
  end
end
