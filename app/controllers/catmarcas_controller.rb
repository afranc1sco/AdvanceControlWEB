class CatmarcasController < ApplicationController
  before_action :set_catmarca, only: [:show, :edit, :update, :destroy]

  # GET /catmarcas
  # GET /catmarcas.json
  def index
    @catmarcas = Catmarca.all
  end

  # GET /catmarcas/1
  # GET /catmarcas/1.json
  def show
  end

  # GET /catmarcas/new
  def new
    @catmarca = Catmarca.new
  end

  # GET /catmarcas/1/edit
  def edit
  end

  # POST /catmarcas
  # POST /catmarcas.json
  def create
    @catmarca = Catmarca.new(catmarca_params)

    if @catmarca.TipoMarca == "P"
      @catmarcas = Catmarca.producto_marca.activos.por_empresa(current_usuario.empresa_id)
      @producto = Producto.new

    elsif @catmarca.TipoMarca == "V"
      @catmarcas = Catmarca.vehiculo_marca.activos.por_empresa(current_usuario.empresa_id)
      @vehiculo = Vehiculo.new

    end

    respond_to do |format|
      if @catmarca.save
        format.html { redirect_to @catmarca, notice: 'Catmarca was successfully created.' }
        format.json { render :show, status: :created, location: @catmarca }
        format.js {flash.now[:notice] = 'La marca se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @catmarca.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la marca.'} #ajax
      end
    end
  end

  # PATCH/PUT /catmarcas/1
  # PATCH/PUT /catmarcas/1.json
  def update
    respond_to do |format|
      if @catmarca.update(catmarca_params)
        format.html { redirect_to @catmarca, notice: 'Catmarca was successfully updated.' }
        format.json { render :show, status: :ok, location: @catmarca }
      else
        format.html { render :edit }
        format.json { render json: @catmarca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catmarcas/1
  # DELETE /catmarcas/1.json
  def destroy
    @catmarca.destroy
    respond_to do |format|
      format.html { redirect_to catmarcas_url, notice: 'Catmarca was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catmarca
      @catmarca = Catmarca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catmarca_params
      params.require(:catmarca).permit(:Clave, :Descripcion, :Status, :TipoMarca, :IdEmpresa)
    end
end
