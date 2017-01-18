class DetallecobController < ApplicationController
  before_action :set_detalleco, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /detallecob
  # GET /detallecob.json
  def index
    @detalleco = Detalleco.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  # GET /detallecob/1
  # GET /detallecob/1.json
  def show
  end

  def obtener_ruta
    respond_to do |format|
      format.html { redirect_to cuentasxcobrar_path(detalleco_params[:RutaId]) } #envio de parametros que se usaran para enviar el la ruta
    end
  end

  def cuentasxcobrar
    @detalleco = Detalleco.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @cobranza = Cobran.por_ruta(params[:id])

  end


  # GET /detallecob/new
  def new
    @detalleco = Detalleco.new
  end

  # GET /detallecob/1/edit
  def edit
  end

  # POST /detallecob
  # POST /detallecob.json
  def create
    @detalleco = Detalleco.new(detalleco_params)
    respond_to do |format|
      if @detalleco.save
        @detalleco.update(Saldo:(@detalleco.SaldoAnt - @detalleco.Abono))
        format.html { redirect_to @detalleco, notice: 'Detalleco was successfully created.' }
        format.json { render :show, status: :created, location: @detalleco }
        format.js {flash.now[:notice] = 'El abono se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @detalleco.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el abono.'} #ajax
      end
    end
  end

  # PATCH/PUT /detallecob/1
  # PATCH/PUT /detallecob/1.json
  def update
    respond_to do |format|
      if @detalleco.update(detalleco_params)
        format.html { redirect_to @detalleco, notice: 'Detalleco was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalleco }
        format.js {flash.now[:notice] = 'El abono se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @detalleco.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el abono.'} #ajax
      end
    end
  end

  # DELETE /detallecob/1
  # DELETE /detallecob/1.json
  def destroy
    @detalleco.destroy
    respond_to do |format|
      format.html { redirect_to detallecob_url, notice: 'Detalleco was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El abono se ha eliminado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalleco
      @detalleco = Detalleco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalleco_params
      params.require(:detalleco).permit(:IdCobranza, :Abono, :Fecha, :RutaId, :SaldoAnt, :Saldo, :FormaP, :DiaO, :Documento, :Cliente, :IdEmpresa, :Cancelada)
    end
end
