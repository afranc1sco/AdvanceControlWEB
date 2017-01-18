require 'test_helper'

class EncuestasControllerTest < ActionController::TestCase
  setup do
    @encuesta = encuestas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:encuestas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create encuesta" do
    assert_difference('Encuesta.count') do
      post :create, encuesta: { Clave_Enc: @encuesta.Clave_Enc, Desc_Enc: @encuesta.Desc_Enc, IdEmpresa: @encuesta.IdEmpresa, Tipo_Enc: @encuesta.Tipo_Enc }
    end

    assert_redirected_to encuesta_path(assigns(:encuesta))
  end

  test "should show encuesta" do
    get :show, id: @encuesta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @encuesta
    assert_response :success
  end

  test "should update encuesta" do
    patch :update, id: @encuesta, encuesta: { Clave_Enc: @encuesta.Clave_Enc, Desc_Enc: @encuesta.Desc_Enc, IdEmpresa: @encuesta.IdEmpresa, Tipo_Enc: @encuesta.Tipo_Enc }
    assert_redirected_to encuesta_path(assigns(:encuesta))
  end

  test "should destroy encuesta" do
    assert_difference('Encuesta.count', -1) do
      delete :destroy, id: @encuesta
    end

    assert_redirected_to encuestas_path
  end
end
