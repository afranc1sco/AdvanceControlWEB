class VehiculosController < ApplicationController
  before_action :set_vehiculo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /vehiculos
  # GET /vehiculos.json
  def index
    @vehiculos = Vehiculo.activos.por_empresa(current_usuario.empresa_id)
    @vehiculo = Vehiculo.new
    @catmarcas = Catmarca.vehiculo_marca.activos.por_empresa(current_usuario.empresa_id)
    @catmarca = Catmarca.new
    respond_to do |format|
      format.html
      format.csv { send_data @vehiculos.to_csv}
      format.xls
    end
  end

  def import
    Vehiculo.import(params[:file])
    redirect_to vehiculos_path, notice: "Vehículos importados."
  end

  def vehiculos_check
    @vehiculox = Vehiculo.comprobar_existencia(params[:vehiculo][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@vehiculox }
    end
  end

  # GET /vehiculos/1
  # GET /vehiculos/1.json
  def show
  end

  # GET /vehiculos/new
  def new
    @vehiculo = Vehiculo.new
  end

  # GET /vehiculos/1/edit
  def edit
  end

  # POST /vehiculos
  # POST /vehiculos.json
  def create
    @catmarcas = Catmarca.vehiculo_marca.activos.por_empresa(current_usuario.empresa_id)
    @vehiculo = Vehiculo.new(vehiculo_params)

    respond_to do |format|
      if @vehiculo.save
        format.html { redirect_to @vehiculo, notice: 'Vehiculo was successfully created.' }
        format.json { render :show, status: :created, location: @vehiculo }
        format.js {flash.now[:notice] = 'El vehículo se ha creado de forma exitosa.'} #ajax


      else
        format.html { render :new }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el vehículo.'} #ajax


      end
    end
  end

  # PATCH/PUT /vehiculos/1
  # PATCH/PUT /vehiculos/1.json
  def update
    respond_to do |format|
      if @vehiculo.update(vehiculo_params)
        format.html { redirect_to @vehiculo, notice: 'Vehiculo was successfully updated.' }
        format.json { render :show, status: :ok, location: @vehiculo }
        format.js {flash.now[:notice] = 'El Veículo se ha actualizado de forma exitosa.'} #ajax


      else
        format.html { render :edit }
        format.json { render json: @vehiculo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'El Vehículo al actualizar la ruta.'} #ajax


      end
    end
  end

  # DELETE /vehiculos/1
  # DELETE /vehiculos/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to vehiculos_url, notice: 'Vehiculo was successfully destroyed.' }
      format.json { head :no_content }
      if @vehiculo.Status == "1"
        @vehiculo.update(Status: "0")
        format.js {flash.now[:notice] = 'El vehículo se ha borrado de forma exitosa.'} #ajax
      else
        @vehiculo.update(Status: "1")
        format.js {flash.now[:notice] = 'El vehículo se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  def inactivos
    @vehiculos = Vehiculo.inactivos.por_empresa(current_usuario.empresa_id)
    respond_to do |format|
      format.html
      format.csv { send_data @vehiculos.to_csv}
      format.xls
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehiculo
      @vehiculo = Vehiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehiculo_params
      params.require(:vehiculo).permit(:Clave, :Modelo_year, :Modelo, :Placas, :Marcas, :Descripcion, :Status, :NumeroEco, :Asignado, :Poliza, :TelSeguro, :MesVerifica, :Kilometraje, :KilometrajeSem, :Aseguradora, :FechaVencSeguro, :FechaUltVerif, :IdEmpresa)
    end
end
