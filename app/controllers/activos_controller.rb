class ActivosController < ApplicationController
  before_action :set_activo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /activos
  # GET /activos.json
  def index
    @activos = Activo.activos.por_empresa(current_usuario.empresa_id)
    @activo = Activo.new
  end

  def inactivos
    @activos = Activo.inactivos.por_empresa(current_usuario.empresa_id)
  end
  # GET /activos/1
  # GET /activos/1.json
  def show
  end

  def activos_check_cb
    @activox = Activo.coprobar_existencia(params[:activo][:CB]).first

    respond_to do |format|
    format.json { render :json => !@activox }
    end
  end

  # GET /activos/new
  def new
    @activo = Activo.new
  end

  # GET /activos/1/edit
  def edit
  end

  # POST /activos
  # POST /activos.json
  def create

    @activo = Activo.new(activo_params)
      respond_to do |format|
        if @activo.save
          format.html { redirect_to @activo, notice: 'Activo was successfully created.' }
          format.json { render :show, status: :created, location: @activo }
          format.js {flash.now[:notice] = 'El activo se ha creado de forma exitosa.'} #ajax
        else
          format.html { render :new }
          format.json { render json: @activo.errors, status: :unprocessable_entity }
          format.js {flash.now[:alert] = 'Error al crear el activo.'} #ajax
        end
      end

  end

  # PATCH/PUT /activos/1
  # PATCH/PUT /activos/1.json
  def update
    respond_to do |format|
      if @activo.update(activo_params)
        format.html { redirect_to @activo, notice: 'Activo was successfully updated.' }
        format.json { render :show, status: :ok, location: @activo }
        format.js {flash.now[:notice] = 'El activo se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @activo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el activo.'} #ajax
      end
    end
  end

  # DELETE /activos/1
  # DELETE /activos/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Activo was successfully destroyed.' }
      format.json { head :no_content }
      if @activo.Status == "Disponible"
        @activo.update(Status:"No disponible")
        format.js {flash.now[:notice] = 'El activo se ha borrado de forma exitosa.'} #ajax
      else
        @activo.update(Status:"Disponible")
        format.js {flash.now[:notice] = 'El activo se ha habilitado de forma exitosa.'} #ajax
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activo
      @activo = Activo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def activo_params
      params.require(:activo).permit(:Descripcion, :Modelo, :Fecha, :cover, :Serie, :CB, :Status, :IdEmpresa)
    end
end
