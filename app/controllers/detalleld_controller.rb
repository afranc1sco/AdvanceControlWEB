class DetalleldController < ApplicationController
  before_action :set_detalle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /detalleld
  # GET /detalleld.json
  def index
    @detalleld = Detalle.productosquetiene(params[:id])
    @detalle = Detalle.new
    @productos = Producto.without_discount(params[:id])
  end

  # GET /detalleld/1
  # GET /detalleld/1.json
  def show
  end

  # GET /detalleld/new
  def new
    @detalle = Detalle.new
  end

  # GET /detalleld/1/edit
  def edit
  end

  # POST /detalleld
  # POST /detalleld.json
  def create
    @detalle = Detalle.new(detalle_params)

    respond_to do |format|
      if @detalle.save
        format.html { redirect_to @detalle, notice: 'Detalle was successfully created.' }
        format.json { render :show, status: :created, location: @detalle }
        format.js {flash.now[:notice] = 'El producto se ha agregado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el producto.'} #ajax

      end
    end
  end

  # PATCH/PUT /detalleld/1
  # PATCH/PUT /detalleld/1.json
  def update
    respond_to do |format|
      if @detalle.update(detalle_params)
        format.html { redirect_to @detalle, notice: 'Detalle was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalle }
        format.js {flash.now[:notice] = 'Se ha Actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @detalle.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar.'} #ajax

      end
    end
  end

  # DELETE /detalleld/1
  # DELETE /detalleld/1.json
  def destroy
    @detalle.destroy
    respond_to do |format|
      format.html { redirect_to detalleld_url, notice: 'Detalle was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El producto se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detalle
      @detalle = Detalle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalle_params
      params.require(:detalle).permit(:ListaId, :Articulo, :Tipo, :Factor, :IdEmpresa)
    end
end
