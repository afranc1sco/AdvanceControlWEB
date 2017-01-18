class ReldaycliController < ApplicationController
  before_action :set_reldayc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /reldaycli
  # GET /reldaycli.json
  def index
    @reldayc = Reldayc.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  def obtener_ruta_y_dia
    respond_to do |format|
      format.html { redirect_to generar_ruta_path(reldayc_params[:RutaId], reldayc_params[:Lunes]) } #envio de parametros que se usaran para enviar el la ruta y el dia como parametro
    end
  end

  def generar_ruta
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @reldayc = Reldayc.new
    @ruta = Ruta.datos_ruta(params[:id])

    @reldaycliglobal = Reldayc.ruta(params[:id]).dia_sin_clientes(params[:id2])


    @reldaycli = Reldayc.ruta(params[:id]).dia_con_clientes(params[:id2]).ordered_by_title

    @reldaycliC = @reldaycli.count


      session[:cuenta] = @reldaycliC

      session[:dia] = (params[:id2])#pasando el parametro a una variable de sesion para pasar el dia al update y evitar que se pierda el dia al actualizar
      @dia = session[:dia]


  end



  # GET /reldaycli/1
  # GET /reldaycli/1.json
  def show
  end

  # GET /reldaycli/new
  def new
    @reldayc = Reldayc.new
  end

  # GET /reldaycli/1/edit
  def edit
  end

  # POST /reldaycli
  # POST /reldaycli.json
  def create
    @reldayc = Reldayc.new(reldayc_params)

    respond_to do |format|
      if @reldayc.save
        format.html { redirect_to @reldayc, notice: 'Reldayc was successfully created.' }
        format.json { render :show, status: :created, location: @reldayc }
        format.js {flash.now[:notice] = 'El cliente se ha agregado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @reldayc.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el cliente.'} #ajax
      end
    end
  end

  # PATCH/PUT /reldaycli/1
  # PATCH/PUT /reldaycli/1.json
  def update
    @dia = session[:dia]

    if @rel == nil
      @rel = session[:cuenta] + 1

    end

    respond_to do |format|
      if @reldayc.update(reldayc_params)

        format.html { redirect_to @reldayc, notice: 'Reldayc was successfully updated.' }
        format.json { render :show, status: :ok, location: @reldayc }
        format.js {flash.now[:notice] = 'Proceso exitoso.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @reldayc.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error en el proceso.'} #ajax
      end
    end
  end

  # DELETE /reldaycli/1
  # DELETE /reldaycli/1.json
  def destroy
    @reldayc.destroy
    respond_to do |format|
      format.html { redirect_to reldaycli_url, notice: 'Reldayc was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El cliente se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reldayc
      @reldayc = Reldayc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reldayc_params
      params.require(:reldayc).permit(:CodCli, :Lunes, :Martes, :Miercoles, :Jueves, :Viernes, :Sabado, :Domingo, :RutaId, :IdEmpresa)
    end
end
