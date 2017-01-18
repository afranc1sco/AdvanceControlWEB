require 'test_helper'

class ConfigrutaspControllerTest < ActionController::TestCase
  setup do
    @configruta = configrutasp(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:configrutasp)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create configruta" do
    assert_difference('Configruta.count') do
      post :create, configruta: { COM: @configruta.COM, CteNvo: @configruta.CteNvo, CveCteNvo: @configruta.CveCteNvo, GPS: @configruta.GPS, IdEmpresa: @configruta.IdEmpresa, ModelPrinter: @configruta.ModelPrinter, PagoContado: @configruta.PagoContado, PromoEq: @configruta.PromoEq, Puerto: @configruta.Puerto, PuertoG: @configruta.PuertoG, RutaId: @configruta.RutaId, Server: @configruta.Server, ServerGPS: @configruta.ServerGPS, SugerirCant: @configruta.SugerirCant, VelCom: @configruta.VelCom }
    end

    assert_redirected_to configruta_path(assigns(:configruta))
  end

  test "should show configruta" do
    get :show, id: @configruta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @configruta
    assert_response :success
  end

  test "should update configruta" do
    patch :update, id: @configruta, configruta: { COM: @configruta.COM, CteNvo: @configruta.CteNvo, CveCteNvo: @configruta.CveCteNvo, GPS: @configruta.GPS, IdEmpresa: @configruta.IdEmpresa, ModelPrinter: @configruta.ModelPrinter, PagoContado: @configruta.PagoContado, PromoEq: @configruta.PromoEq, Puerto: @configruta.Puerto, PuertoG: @configruta.PuertoG, RutaId: @configruta.RutaId, Server: @configruta.Server, ServerGPS: @configruta.ServerGPS, SugerirCant: @configruta.SugerirCant, VelCom: @configruta.VelCom }
    assert_redirected_to configruta_path(assigns(:configruta))
  end

  test "should destroy configruta" do
    assert_difference('Configruta.count', -1) do
      delete :destroy, id: @configruta
    end

    assert_redirected_to configrutasp_path
  end
end
