class EmpresasController < ApplicationController
  before_action :set_empresa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!


  # GET /empresas
  # GET /empresas.json


  def sucursales
    @empresas = Empresa.de_empresamadre(params[:id])
    @empresa = Empresa.new
    @EmpresaMadre = Empresamadre.datos(params[:id])

    respond_to do |format|
      format.html
      format.csv { send_data @empresas.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end


  def empresas_check
    @sucursalx = Empresa.comprobar_existencia(params[:empresa][:IdEmpresa]).first
    respond_to do |format|
    format.json { render :json => !@sucursalx }
    end
  end

  def import
    Empresa.import(params[:file])
    redirect_to empresas_path, notice: "Sucursales importadas."
  end

  # GET /empresas/1
  # GET /empresas/1.json
  def show
  end

  # GET /empresas/new
  def new
    @empresa = Empresa.new
  end

  # GET /empresas/1/edit
  def edit
  end

  # POST /empresas
  # POST /empresas.json
  def create
    @empresa = Empresa.new(empresa_params)

    respond_to do |format|
      if @empresa.save
        format.html { redirect_to @empresa, notice: 'Empresa was successfully created.' }
        format.json { render :show, status: :created, location: @empresa }
        format.js {flash.now[:notice] = 'La Sucursal se ha creado de forma exitosa.'} #ajax


      else
        format.html { render :new }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la sucursal.'} #ajax


      end
    end
  end

  # PATCH/PUT /empresas/1
  # PATCH/PUT /empresas/1.json
  def update
    respond_to do |format|
      if @empresa.update(empresa_params)
        format.html { redirect_to @empresa, notice: 'Empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresa }
        format.js {flash.now[:notice] = 'La Sucursal se ha actualizado de forma exitosa.'} #ajax


      else
        format.html { render :edit }
        format.json { render json: @empresa.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la sucursal.'} #ajax


      end
    end
  end

  # DELETE /empresas/1
  # DELETE /empresas/1.json
  def destroy
    @empresa.destroy
    respond_to do |format|
      format.html { redirect_to empresas_url, notice: 'Empresa was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La Sucursal se ha borrado de forma exitosa.'} #ajax


    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresa
      @empresa = Empresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresa_params
      params.require(:empresa).permit(:IdEmpresa, :RFC, :Sucursal, :Direccion, :Calle, :NoExterior, :NoInterior, :CP, :Telefono, :Contacto, :Email, :Direccion, :empresamadre_id, :NombreComercial)
    end
end
