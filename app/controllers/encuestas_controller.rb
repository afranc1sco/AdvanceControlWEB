class EncuestasController < ApplicationController
  before_action :set_encuesta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /encuestas
  # GET /encuestas.json
  def index
    @encuestas = Encuesta.por_empresa(current_usuario.empresa_id)
    @encuesta = Encuesta.new
    respond_to do |format|
      format.html
      format.csv { send_data @encuestas.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  # GET /encuestas/1
  # GET /encuestas/1.json
  def show
  end

  # GET /encuestas/new
  def new
    @encuesta = Encuesta.new
  end

  # GET /encuestas/1/edit
  def edit
  end

  # POST /encuestas
  # POST /encuestas.json
  def create
    @encuesta = Encuesta.new(encuesta_params)

    respond_to do |format|
      if @encuesta.save
        format.html { redirect_to @encuesta, notice: 'Encuesta was successfully created.' }
        format.json { render :show, status: :created, location: @encuesta }
        format.js {flash.now[:notice] = 'La encuesta se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la encuesta.'} #ajax

      end
    end
  end

  # PATCH/PUT /encuestas/1
  # PATCH/PUT /encuestas/1.json
  def update
    respond_to do |format|
      if @encuesta.update(encuesta_params)
        format.html { redirect_to @encuesta, notice: 'Encuesta was successfully updated.' }
        format.json { render :show, status: :ok, location: @encuesta }
        format.js {flash.now[:notice] = 'La encuesta se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @encuesta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la encuesta.'} #ajax

      end
    end
  end

  # DELETE /encuestas/1
  # DELETE /encuestas/1.json
  def destroy
    @encuesta.destroy
    respond_to do |format|
      format.html { redirect_to encuestas_url, notice: 'Encuesta was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La encuesta se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encuesta
      @encuesta = Encuesta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encuesta_params
      params.require(:encuesta).permit(:Clave_Enc, :Desc_Enc, :Tipo_Enc, :IdEmpresa)
    end
end
