class CatunidadmedidaController < ApplicationController
  before_action :set_catunidadmed, only: [:show, :edit, :update, :destroy]

  # GET /catunidadmedida
  # GET /catunidadmedida.json
  def index
    @catunidadmedida = Catunidadmed.all
  end

  # GET /catunidadmedida/1
  # GET /catunidadmedida/1.json
  def show
  end

  # GET /catunidadmedida/new
  def new
    @catunidadmed = Catunidadmed.new
  end

  # GET /catunidadmedida/1/edit
  def edit
  end

  # POST /catunidadmedida
  # POST /catunidadmedida.json
  def create
    @catunidadmed = Catunidadmed.new(catunidadmed_params)
    @unidadmedidas = Catunidadmed.activos.por_empresa(current_usuario.empresa_id)
    @producto = Producto.new

    respond_to do |format|
      if @catunidadmed.save
        format.html { redirect_to @catunidadmed, notice: 'Catunidadmed was successfully created.' }
        format.json { render :show, status: :created, location: @catunidadmed }
        format.js {flash.now[:notice] = 'La unidad se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @catunidadmed.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la unidad.'} #ajax
      end
    end
  end

  # PATCH/PUT /catunidadmedida/1
  # PATCH/PUT /catunidadmedida/1.json
  def update
    respond_to do |format|
      if @catunidadmed.update(catunidadmed_params)
        format.html { redirect_to @catunidadmed, notice: 'Catunidadmed was successfully updated.' }
        format.json { render :show, status: :ok, location: @catunidadmed }
      else
        format.html { render :edit }
        format.json { render json: @catunidadmed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catunidadmedida/1
  # DELETE /catunidadmedida/1.json
  def destroy
    @catunidadmed.destroy
    respond_to do |format|
      format.html { redirect_to catunidadmedida_url, notice: 'Catunidadmed was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catunidadmed
      @catunidadmed = Catunidadmed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catunidadmed_params
      params.require(:catunidadmed).permit(:Clave, :UnidadMedida, :Abreviatura, :Status, :IdEmpresa)
    end
end
