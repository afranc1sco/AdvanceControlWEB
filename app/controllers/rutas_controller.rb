class RutasController < ApplicationController
  before_action :set_ruta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /rutas
  # GET /rutas.json
  def index
    @rutas = Ruta.activos.por_empresa(current_usuario.empresa_id).primeros
    @ruta = Ruta.new
    @ruta.build_configruta #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build
    @ruta.build_continuid #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    @ruta.build_relrucla

    @vendedores = Vendedor.activos.por_empresa(current_usuario.empresa_id).vendedores.vendedores_sin_ruta.ordered
    @ayudantes = Vendedor.activos.por_empresa(current_usuario.empresa_id).ayudantes.vendedores_sin_ruta.ordered
    @vehiculos = Vehiculo.activos.por_empresa(current_usuario.empresa_id).ordered

    @clas1 = Clasruta.clas1_scope
    @clas2 = Clasruta.clas2_scope
    @clas3 = Clasruta.clas3_scope
    @clas4 = Clasruta.clas4_scope
    @clas5 = Clasruta.clas5_scope


    respond_to do |format|
      format.html
      format.csv { send_data @rutas.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def inactivos
    @rutas = Ruta.inactivos.por_empresa(current_usuario.empresa_id).primeros
    @ruta = Ruta.new
    @ruta.build_configruta #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build
    @ruta.build_continuid #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    @ruta.build_relrucla

    @vendedores = Vendedor.activos.por_empresa(current_usuario.empresa_id).vendedores.vendedores_sin_ruta.ordered
    @ayudantes = Vendedor.activos.por_empresa(current_usuario.empresa_id).ayudantes.vendedores_sin_ruta.ordered
    @vehiculos = Vehiculo.activos.por_empresa(current_usuario.empresa_id).ordered

    @clas1 = Clasruta.clas1_scope
    @clas2 = Clasruta.clas2_scope
    @clas3 = Clasruta.clas3_scope
    @clas4 = Clasruta.clas4_scope
    @clas5 = Clasruta.clas5_scope


    respond_to do |format|
      format.html
      format.csv { send_data @rutas.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def rutas_check
    @rutax = Ruta.comprobar_existencia(params[:ruta][:Ruta]).first

    respond_to do |format|
    format.json { render :json => !@rutax }
    end
  end


  def import
    Ruta.import(params[:file])
    redirect_to rutas_path, notice: "Rutas importadas."
  end
  # GET /rutas/1
  # GET /rutas/1.json
  def show
  end

  # GET /rutas/new
  def new
    @ruta = Ruta.new
  end

  # GET /rutas/1/edit
  def edit
  end

  # POST /rutas
  # POST /rutas.json
  def create

    @vendedores = Vendedor.activos.por_empresa(current_usuario.empresa_id).vendedores
    @ayudantes = Vendedor.activos.por_empresa(current_usuario.empresa_id).ayudantes

    @clas1 = Clasruta.clas1_scope
    @clas2 = Clasruta.clas2_scope
    @clas3 = Clasruta.clas3_scope
    @clas4 = Clasruta.clas4_scope
    @clas5 = Clasruta.clas5_scope

    @ruta = Ruta.new(ruta_params)

    respond_to do |format|
      if @ruta.save
        format.html { redirect_to @ruta, notice: 'Ruta was successfully created.' }
        format.json { render :show, status: :created, location: @ruta }
        format.js {flash.now[:notice] = 'La Ruta se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @ruta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la ruta.'} #ajax

      end
    end
  end

  # PATCH/PUT /rutas/1
  # PATCH/PUT /rutas/1.json
  def update

    @vendedores = Vendedor.activos.por_empresa(current_usuario.empresa_id).vendedores
    @ayudantes = Vendedor.activos.por_empresa(current_usuario.empresa_id).ayudantes
    @vehiculos = Vehiculo.activos.por_empresa(current_usuario.empresa_id).ordered

    @clas1 = Clasruta.clas1_scope
    @clas2 = Clasruta.clas2_scope
    @clas3 = Clasruta.clas3_scope
    @clas4 = Clasruta.clas4_scope
    @clas5 = Clasruta.clas5_scope

    respond_to do |format|
      if @ruta.update(ruta_params)
        format.html { redirect_to @ruta, notice: 'Ruta was successfully updated.' }
        format.json { render :show, status: :ok, location: @ruta }
        format.js {flash.now[:notice] = 'La ruta se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @ruta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la ruta.'} #ajax

      end
    end
  end

  # DELETE /rutas/1
  # DELETE /rutas/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to vendedores_url, notice: 'La ruta was successfully destroyed.' }
      format.json { head :no_content }
      if @ruta.Activa == true
        @ruta.update(Activa:false)
        format.js {flash.now[:notice] = 'La ruta se ha borrado de forma exitosa.'} #ajax
      else
        @ruta.update(Activa:true)
        format.js {flash.now[:notice] = 'La ruta se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ruta
      @ruta = Ruta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ruta_params
      params.require(:ruta).permit(:Ruta, :Activa, :TipoRuta, :VenSinStock, :Oficina, :Sector, :Vendedor, :Tipo, :id_ayudante1, :id_ayudante2, :VendedorAyudante, :Foranea, :vehiculo, :idcrutas, :IdEmpresa, configruta_attributes: [:id, :RutaId, :ModelPrinter, :VelCom, :COM, :Server, :Puerto, :ServerGPS, :GPS, :PuertoG, :PagoContado, :CteNvo, :CveCteNvo, :IdEmpresa, :SugerirCant, :PromoEq], relrucla_attributes: [:id, :RutaId, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa], continuid_attributes: [:id, :RutaID, :DiaO, :FolVta, :FolPed, :FolDevol, :FolCob, :UDiaO, :CteNvo, :IdEmpresa])
    end
end
