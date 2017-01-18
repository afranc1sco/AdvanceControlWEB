class RelmensController < ApplicationController
  before_action :set_relmen, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relmens
  # GET /relmens.json
  def index
    @relmens = Relmen.productosquetiene(params[:id])
    @relmen = Relmen.new
    @productos = Producto.all
  end

  def clientes
    @relmens = Relmen.clientesquetiene(params[:id])
    @relmen = Relmen.new
    @clientes = Cliente.primeros
  end

  def rutas
    @relmens = Relmen.rutasquetiene(params[:id])
    @relmen = Relmen.new
    @rutas = Ruta.all
  end

  # GET /relmens/1
  # GET /relmens/1.json
  def show
  end

  # GET /relmens/new
  def new
    @relmen = Relmen.new
  end

  # GET /relmens/1/edit
  def edit
  end

  # POST /relmens
  # POST /relmens.json
  def create
    @relmen = Relmen.new(relmen_params)

    respond_to do |format|
      if @relmen.save
        format.html { redirect_to @relmen, notice: 'Relmen was successfully created.' }
        format.json { render :show, status: :created, location: @relmen }
        format.js {flash.now[:notice] = 'El registro se ha agregado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @relmen.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el registro.'} #ajax

      end
    end
  end

  # PATCH/PUT /relmens/1
  # PATCH/PUT /relmens/1.json
  def update
    respond_to do |format|
      if @relmen.update(relmen_params)
        format.html { redirect_to @relmen, notice: 'Relmen was successfully updated.' }
        format.json { render :show, status: :ok, location: @relmen }
        format.js {flash.now[:notice] = 'La lista se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @relmen.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la lista.'} #ajax

      end
    end
  end

  # DELETE /relmens/1
  # DELETE /relmens/1.json
  def destroy
    @relmen.destroy
    respond_to do |format|
      format.html { redirect_to relmens_url, notice: 'Relmen was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El registro se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relmen
      @relmen = Relmen.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relmen_params
      params.require(:relmen).permit(:MenId, :CodCliente, :IdCliente, :CodProducto, :IdProducto, :CodRuta, :IdRuta, :IdEmpresa)
    end
end
