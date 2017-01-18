require 'test_helper'

class RutasControllerTest < ActionController::TestCase
  setup do
    @ruta = rutas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rutas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ruta" do
    assert_difference('Ruta.count') do
      post :create, ruta: { Activa: @ruta.Activa, Foranea: @ruta.Foranea, IdEmpresa: @ruta.IdEmpresa, Oficina: @ruta.Oficina, Ruta: @ruta.Ruta, Sector: @ruta.Sector, Tipo: @ruta.Tipo, TipoRuta: @ruta.TipoRuta, VenSinStock: @ruta.VenSinStock, Vendedor: @ruta.Vendedor, VendedorAyudante: @ruta.VendedorAyudante, id_ayudante1: @ruta.id_ayudante1, id_ayudante2: @ruta.id_ayudante2, idcrutas: @ruta.idcrutas, vehiculo: @ruta.vehiculo }
    end

    assert_redirected_to ruta_path(assigns(:ruta))
  end

  test "should show ruta" do
    get :show, id: @ruta
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ruta
    assert_response :success
  end

  test "should update ruta" do
    patch :update, id: @ruta, ruta: { Activa: @ruta.Activa, Foranea: @ruta.Foranea, IdEmpresa: @ruta.IdEmpresa, Oficina: @ruta.Oficina, Ruta: @ruta.Ruta, Sector: @ruta.Sector, Tipo: @ruta.Tipo, TipoRuta: @ruta.TipoRuta, VenSinStock: @ruta.VenSinStock, Vendedor: @ruta.Vendedor, VendedorAyudante: @ruta.VendedorAyudante, id_ayudante1: @ruta.id_ayudante1, id_ayudante2: @ruta.id_ayudante2, idcrutas: @ruta.idcrutas, vehiculo: @ruta.vehiculo }
    assert_redirected_to ruta_path(assigns(:ruta))
  end

  test "should destroy ruta" do
    assert_difference('Ruta.count', -1) do
      delete :destroy, id: @ruta
    end

    assert_redirected_to rutas_path
  end
end
