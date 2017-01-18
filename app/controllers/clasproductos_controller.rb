class ClasproductosController < ApplicationController
  before_action :set_clasproducto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /clasproductos
  # GET /clasproductos.json
  def index
    @clasproductos = Clasproducto.all
    @clasproducto = Clasproducto.new
  end

  # GET /clasproductos/1
  # GET /clasproductos/1.json
  def show
  end

  # GET /clasproductos/new
  def new
    @clasproducto = Clasproducto.new
  end

  # GET /clasproductos/1/edit
  def edit
  end

  # POST /clasproductos
  # POST /clasproductos.json
  def create
    @clasproducto = Clasproducto.new(clasproducto_params)

    respond_to do |format|
      if @clasproducto.save
        format.html { redirect_to @clasproducto, notice: 'Clasproducto was successfully created.' }
        format.json { render :show, status: :created, location: @clasproducto }
        format.js {flash.now[:notice] = 'La clasificación se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @clasproducto.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la clasificación.'} #ajax
      end
    end
  end

  # PATCH/PUT /clasproductos/1
  # PATCH/PUT /clasproductos/1.json
  def update
    respond_to do |format|
      if @clasproducto.update(clasproducto_params)
        format.html { redirect_to @clasproducto, notice: 'Clasproducto was successfully updated.' }
        format.json { render :show, status: :ok, location: @clasproducto }
        format.js {flash.now[:notice] = 'La clasificación se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @clasproducto.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la clasificación.'} #ajax
      end
    end
  end

  # DELETE /clasproductos/1
  # DELETE /clasproductos/1.json
  def destroy
    @clasproducto.destroy
    respond_to do |format|
      format.html { redirect_to clasproductos_url, notice: 'Clasproducto was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La clasificación se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clasproducto
      @clasproducto = Clasproducto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clasproducto_params
      params.require(:clasproducto).permit(:Descripcion, :NivelNum, :IdEmpresa)
    end
end
