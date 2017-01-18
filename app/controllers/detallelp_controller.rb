class DetallelpController < ApplicationController
  before_action :set_deta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /detallelp
  # GET /detallelp.json
  def index
    @detallelp = Deta.productosquetiene(params[:id])
    @deta = Deta.new
    @productos = Producto.all
    @list = List.comp_si_es_por_rango_de_precios(params[:id])
  end

  # GET /detallelp/1
  # GET /detallelp/1.json
  def show
  end

  # GET /detallelp/new
  def new
    @deta = Deta.new
  end

  # GET /detallelp/1/edit
  def edit
  end

  # POST /detallelp
  # POST /detallelp.json
  def create
    @deta = Deta.new(deta_params)

    respond_to do |format|
      if @deta.save
        format.html { redirect_to @deta, notice: 'Deta was successfully created.' }
        format.json { render :show, status: :created, location: @deta }
        format.js {flash.now[:notice] = 'El producto se ha agrega de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @deta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el producto.'} #ajax


      end
    end
  end

  # PATCH/PUT /detallelp/1
  # PATCH/PUT /detallelp/1.json
  def update
    respond_to do |format|
      if @deta.update(deta_params)
        format.html { redirect_to @deta, notice: 'Deta was successfully updated.' }
        format.json { render :show, status: :ok, location: @deta }
        format.js {flash.now[:notice] = 'Se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @deta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar.'} #ajax

      end
    end
  end

  # DELETE /detallelp/1
  # DELETE /detallelp/1.json
  def destroy
    @deta.destroy
    respond_to do |format|
      format.html { redirect_to detallelp_url, notice: 'Deta was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El producto se ha quitado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deta
      @deta = Deta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deta_params
      params.require(:deta).permit(:ListaId, :Articulo, :PrecioMin, :PrecioMax, :IdEmpresa)
    end
end
