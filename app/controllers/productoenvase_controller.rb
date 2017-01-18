class ProductoenvaseController < ApplicationController
  before_action :set_productoenvas, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /productoenvase
  # GET /productoenvase.json
  def index
    @productoenvase = Productoenvas.productosquetiene(params[:id])
    @productoenvas = Productoenvas.new
    @productos_envases = Producto.activos.envases.por_empresa(current_usuario.empresa_id)
    @producto = Producto.datos_producto(params[:id])

  end

  # GET /productoenvase/1
  # GET /productoenvase/1.json
  def show
  end

  # GET /productoenvase/new
  def new
    @productoenvas = Productoenvas.new
  end

  # GET /productoenvase/1/edit
  def edit
  end

  # POST /productoenvase
  # POST /productoenvase.json
  def create
    @productoenvas = Productoenvas.new(productoenvas_params)

    respond_to do |format|
      if @productoenvas.save
        format.html { redirect_to @productoenvas, notice: 'Productoenvas was successfully created.' }
        format.json { render :show, status: :created, location: @productoenvas }
        format.js {flash.now[:notice] = 'El envase se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @productoenvas.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el envase.'} #ajax
      end
    end
  end

  # PATCH/PUT /productoenvase/1
  # PATCH/PUT /productoenvase/1.json
  def update
    respond_to do |format|
      if @productoenvas.update(productoenvas_params)
        format.html { redirect_to @productoenvas, notice: 'Productoenvas was successfully updated.' }
        format.json { render :show, status: :ok, location: @productoenvas }
      else
        format.html { render :edit }
        format.json { render json: @productoenvas.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productoenvase/1
  # DELETE /productoenvase/1.json
  def destroy
    @productoenvas.destroy
    respond_to do |format|
      format.html { redirect_to productoenvase_url, notice: 'Productoenvas was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El envase se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productoenvas
      @productoenvas = Productoenvas.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productoenvas_params
      params.require(:productoenvas).permit(:Producto, :Envase, :Cant_Base, :Cant_Eq, :Status, :IdEmpresa)
    end
end
