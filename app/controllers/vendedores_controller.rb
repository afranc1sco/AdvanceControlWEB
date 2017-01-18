class VendedoresController < ApplicationController
  before_action :set_vendedor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /vendedores
  # GET /vendedores.json
  def index
    @vendedores = Vendedor.activos.por_empresa(current_usuario.empresa_id)
    @vendedor = Vendedor.new

    respond_to do |format|
      format.html
      format.csv { send_data @vendedores.to_csv}
      format.xls
    end

  end

  def import
    Vendedor.import(params[:file])
    redirect_to vendedores_path, notice: "Vendedores importadas."
  end

  def vendedores_check
    @vendedorx = Vendedor.comprobar_existencia(params[:vendedor][:Clave]).first

    respond_to do |format|
    format.json { render :json => !@vendedorx }
    end
  end

  # GET /vendedores/1
  # GET /vendedores/1.json
  def show
  end

  # GET /vendedores/new
  def new
    @vendedor = Vendedor.new
  end

  # GET /vendedores/1/edit
  def edit
  end

  # POST /vendedores
  # POST /vendedores.json
  def create
    @vendedor = Vendedor.new(vendedor_params)

    respond_to do |format|
      if @vendedor.save
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully created.' }
        format.json { render :show, status: :created, location: @vendedor }
        format.js {flash.now[:notice] = 'El Empleado se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el Empleado.'} #ajax

      end
    end
  end

  # PATCH/PUT /vendedores/1
  # PATCH/PUT /vendedores/1.json
  def update
    respond_to do |format|
      if @vendedor.update(vendedor_params)
        format.html { redirect_to @vendedor, notice: 'Vendedor was successfully updated.' }
        format.json { render :show, status: :ok, location: @vendedor }
        format.js {flash.now[:notice] = 'El Empleado se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @vendedor.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el Empleado.'} #ajax

      end
    end
  end

  # DELETE /vendedores/1
  # DELETE /vendedores/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to vendedores_url, notice: 'Vendedor was successfully destroyed.' }
      format.json { head :no_content }
      if @vendedor.Status == true
        @vendedor.update(Status:false)
        format.js {flash.now[:notice] = 'El Empleado se ha borrado de forma exitosa.'} #ajax
      else
        @vendedor.update(Status:true)
        format.js {flash.now[:notice] = 'El Empleado se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end


  def inactivos
    @vendedores = Vendedor.inactivos.por_empresa(current_usuario.empresa_id)
    respond_to do |format|
      format.html
      format.csv { send_data @vendedores.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendedor
      @vendedor = Vendedor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vendedor_params
      params.require(:vendedor).permit(:Nombre, :Status, :Direccion, :Telefono, :PdaPw, :NumLicencia, :MetaDiaria, :MetaMes, :Movil, :VenceLic, :Clave, :IdEmpresa, :Tipo)
    end
end
