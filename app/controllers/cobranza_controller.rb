class CobranzaController < ApplicationController
  before_action :set_cobran, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /cobranza
  # GET /cobranza.json
  def index
    @cobranbusc = Cobran.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)

  end

  def index_cobranza_bitacora
    @clientes = Cliente.por_empresa(current_usuario.empresa_id).activos
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  # GET /cobranza/1
  # GET /cobranza/1.json
  def show
  end

  def obtener_ruta
    respond_to do |format|
      format.html { redirect_to ctasxcobrar_path(cobran_params[:RutaId]) } #envio de parametros que se usaran para enviar el la ruta
    end
  end




  def busqueda_cobranza

   @cobranza_bitacora = Cobran.busqueda_cobranza(params)


   @detallecob = Detalleco.all
   @Formaspago = Formapag.activos
   @cobranbusc = Cobran.new
   @detalleco = Detalleco.new
   @clientes = Cliente.por_empresa(current_usuario.empresa_id).activos



   @detallevet = Detalleve.all
   @venta = Vent.all

    respond_to do |format|
    format.js
    end
  end

  def ctasxcobrar
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @cobranza = Cobran.aquellos_con_saldo_pendiente.por_ruta(params[:id])
    @detalleco = Detalleco.new
    @detallecob = Detalleco.all.order(Id: :desc)
    @Formaspago = Formapag.activos
    @cobranbusc = Cobran.new
  end




  # GET /cobranza/new
  def new
    @cobran = Cobran.new
  end

  # GET /cobranza/1/edit
  def edit
  end

  # POST /cobranza
  # POST /cobranza.json
  def create
    @cobran = Cobran.new(cobran_params)

    respond_to do |format|
      if @cobran.save
        format.html { redirect_to @cobran, notice: 'Cobran was successfully created.' }
        format.json { render :show, status: :created, location: @cobran }
        format.js {flash.now[:notice] = 'La cobranza se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @cobran.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la cobranza.'} #ajax
      end
    end
  end

  # PATCH/PUT /cobranza/1
  # PATCH/PUT /cobranza/1.json
  def update
    respond_to do |format|
      if @cobran.update(cobran_params)
        format.html { redirect_to @cobran, notice: 'Cobran was successfully updated.' }
        format.json { render :show, status: :ok, location: @cobran }
        format.js {flash.now[:notice] = 'La cobranza se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @cobran.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la cobranza.'} #ajax
      end
    end
  end

  # DELETE /cobranza/1
  # DELETE /cobranza/1.json
  def destroy
    @cobran.destroy
    respond_to do |format|
      format.html { redirect_to cobranza_url, notice: 'Cobran was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La cobranza se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cobran
      @cobran = Cobran.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cobran_params
      params.require(:cobran).permit(:Cliente, :Documento, :Saldo, :Status, :RutaId, :UltPago, :FechaPag, :FechaVence, :FolioInterno, :TipoDoc, :DiaO, :IdEmpresa)
    end
end
