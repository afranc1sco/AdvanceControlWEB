class RelactivosController < ApplicationController
  before_action :set_relactivo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relactivos
  # GET /relactivos.json


  def activos_cliente
    @activos = Activo.activos_sin_clientes
    #  @activos = Activo.joins('left outer join relactivos on activos.IdActivos=relactivos.Activo').select('activos.*,relactivos.Activo').where('relactivos.Activo is null')

    @cliente = Cliente.datos_cliente(params[:id])
    @relactivo = Relactivo.new
    @relactivos = Relactivo.por_empresa(current_usuario.empresa_id).activos_del_cliente(params[:id])
  end

  # GET /relactivos/1
  # GET /relactivos/1.json
  def show
  end

  # GET /relactivos/new
  def new
    @relactivo = Relactivo.new
  end

  # GET /relactivos/1/edit
  def edit
  end

  # POST /relactivos
  # POST /relactivos.json
  def create
    @relactivo = Relactivo.new(relactivo_params)

    respond_to do |format|
      if @relactivo.save
        format.html { redirect_to @relactivo, notice: 'Relactivo was successfully created.' }
        format.json { render :show, status: :created, location: @relactivo }
        format.js {flash.now[:notice] = 'El activo se ha agregado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @relactivo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el activo.'} #ajax
      end
    end
  end

  # PATCH/PUT /relactivos/1
  # PATCH/PUT /relactivos/1.json
  def update
    respond_to do |format|
      if @relactivo.update(relactivo_params)
        format.html { redirect_to @relactivo, notice: 'Relactivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @relactivo }
        format.js {flash.now[:notice] = 'El activo se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @relactivo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el activo.'} #ajax
      end
    end
  end

  # DELETE /relactivos/1
  # DELETE /relactivos/1.json
  def destroy
    @relactivo.destroy
    respond_to do |format|
      format.html { redirect_to relactivos_url, notice: 'Relactivo was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El activo se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relactivo
      @relactivo = Relactivo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relactivo_params
      params.require(:relactivo).permit(:Cliente, :Activo, :FechaAsignacion, :IdEmpresa)
    end
end
