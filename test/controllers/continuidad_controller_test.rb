require 'test_helper'

class ContinuidadControllerTest < ActionController::TestCase
  setup do
    @continuid = continuidad(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:continuidad)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create continuid" do
    assert_difference('Continuid.count') do
      post :create, continuid: { CteNvo: @continuid.CteNvo, DiaO: @continuid.DiaO, FolCob: @continuid.FolCob, FolDevol: @continuid.FolDevol, FolPed: @continuid.FolPed, FolVta: @continuid.FolVta, IdEmpresa: @continuid.IdEmpresa, RutaID: @continuid.RutaID, UDiaO: @continuid.UDiaO }
    end

    assert_redirected_to continuid_path(assigns(:continuid))
  end

  test "should show continuid" do
    get :show, id: @continuid
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @continuid
    assert_response :success
  end

  test "should update continuid" do
    patch :update, id: @continuid, continuid: { CteNvo: @continuid.CteNvo, DiaO: @continuid.DiaO, FolCob: @continuid.FolCob, FolDevol: @continuid.FolDevol, FolPed: @continuid.FolPed, FolVta: @continuid.FolVta, IdEmpresa: @continuid.IdEmpresa, RutaID: @continuid.RutaID, UDiaO: @continuid.UDiaO }
    assert_redirected_to continuid_path(assigns(:continuid))
  end

  test "should destroy continuid" do
    assert_difference('Continuid.count', -1) do
      delete :destroy, id: @continuid
    end

    assert_redirected_to continuidad_path
  end
end
