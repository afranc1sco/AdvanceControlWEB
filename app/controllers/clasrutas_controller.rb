class ClasrutasController < ApplicationController
  before_action :set_clasruta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /clasrutas
  # GET /clasrutas.json
  def index
    @clasrutas = Clasruta.all
    @clasruta = Clasruta.new
  end

  # GET /clasrutas/1
  # GET /clasrutas/1.json
  def show
  end

  # GET /clasrutas/new
  def new
    @clasruta = Clasruta.new
  end

  # GET /clasrutas/1/edit
  def edit
  end

  # POST /clasrutas
  # POST /clasrutas.json
  def create
    @clasruta = Clasruta.new(clasruta_params)

    respond_to do |format|
      if @clasruta.save
        format.html { redirect_to @clasruta, notice: 'Clasruta was successfully created.' }
        format.json { render :show, status: :created, location: @clasruta }
        format.js {flash.now[:notice] = 'El cliente se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @clasruta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la clasificación.'} #ajax
      end
    end
  end

  # PATCH/PUT /clasrutas/1
  # PATCH/PUT /clasrutas/1.json
  def update
    respond_to do |format|
      if @clasruta.update(clasruta_params)
        format.html { redirect_to @clasruta, notice: 'Clasruta was successfully updated.' }
        format.json { render :show, status: :ok, location: @clasruta }
        format.js {flash.now[:notice] = 'La clasificación se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @clasruta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la clasificación.'} #ajax
      end
    end
  end

  # DELETE /clasrutas/1
  # DELETE /clasrutas/1.json
  def destroy
    @clasruta.destroy
    respond_to do |format|
      format.html { redirect_to clasrutas_url, notice: 'Clasruta was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La clasificación se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clasruta
      @clasruta = Clasruta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clasruta_params
      params.require(:clasruta).permit(:IdCRutas, :Descripcion, :NivelNum)
    end
end
