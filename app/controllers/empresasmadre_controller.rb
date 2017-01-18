class EmpresasmadreController < ApplicationController
  before_action :set_empresamadre, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /empresasmadre
  # GET /empresasmadre.json
  def index
    @empresasmadre = Empresamadre.all
    @empresamadre = Empresamadre.new
  end

  def import
    Empresamadre.import(params[:file])
    redirect_to empresasmadre_path, notice: "Empresas importadas."
  end



  def empresasmadre_check
    @empresamadrex = Empresamadre.comprobar_existencia(params[:empresamadre][:id]).first
    respond_to do |format|
    format.json { render :json => !@empresamadrex }
    end
  end

  # GET /empresasmadre/1
  # GET /empresasmadre/1.json
  def show
  end

  # GET /empresasmadre/new
  def new
    @empresamadre = Empresamadre.new
  end

  # GET /empresasmadre/1/edit
  def edit
  end

  # POST /empresasmadre
  # POST /empresasmadre.json
  def create
    @empresamadre = Empresamadre.new(empresamadre_params)

    respond_to do |format|
      if @empresamadre.save
        format.html { redirect_to @empresamadre, notice: 'Empresamadre was successfully created.' }
        format.json { render :show, status: :created, location: @empresamadre }
        format.js {flash.now[:notice] = 'La Empresa se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @empresamadre.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la empresa.'} #ajax
      end
    end
  end

  # PATCH/PUT /empresasmadre/1
  # PATCH/PUT /empresasmadre/1.json
  def update
    respond_to do |format|
      if @empresamadre.update(empresamadre_params)
        format.html { redirect_to @empresamadre, notice: 'Empresamadre was successfully updated.' }
        format.json { render :show, status: :ok, location: @empresamadre }
        format.js {flash.now[:notice] = 'La empresa se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @empresamadre.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la empresa.'} #ajax
      end
    end
  end

  # DELETE /empresasmadre/1
  # DELETE /empresasmadre/1.json
  def destroy
    @empresamadre.destroy
    respond_to do |format|
      format.html { redirect_to empresasmadre_url, notice: 'Empresamadre was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La empresa se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empresamadre
      @empresamadre = Empresamadre.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empresamadre_params
      params.require(:empresamadre).permit(:Empresa, :id, :Telefono, :Contacto, :Email, :RFC, :Direccion, :Calle, :NoExterior, :NoInterior, :CP, :NombreComercial)
    end
end
