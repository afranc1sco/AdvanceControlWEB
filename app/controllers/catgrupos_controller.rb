class CatgruposController < ApplicationController
  before_action :set_catgrupo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /catgrupos
  # GET /catgrupos.json
  def index
    @catgrupos = Catgrupo.all
  end

  # GET /catgrupos/1
  # GET /catgrupos/1.json
  def show
  end

  # GET /catgrupos/new
  def new
    @catgrupo = Catgrupo.new
  end

  # GET /catgrupos/1/edit
  def edit
  end

  # POST /catgrupos
  # POST /catgrupos.json
  def create
    @catgrupo = Catgrupo.new(catgrupo_params)
    @catgrupos = Catgrupo.activos.producto_sector.por_empresa(current_usuario.empresa_id)
    @producto = Producto.new

    respond_to do |format|
      if @catgrupo.save
        format.html { redirect_to @catgrupo, notice: 'Catgrupo was successfully created.' }
        format.json { render :show, status: :created, location: @catgrupo }
        format.js {flash.now[:notice] = 'La categoria se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @catgrupo.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la categoria.'} #ajax
      end
    end
  end

  # PATCH/PUT /catgrupos/1
  # PATCH/PUT /catgrupos/1.json
  def update
    respond_to do |format|
      if @catgrupo.update(catgrupo_params)
        format.html { redirect_to @catgrupo, notice: 'Catgrupo was successfully updated.' }
        format.json { render :show, status: :ok, location: @catgrupo }
      else
        format.html { render :edit }
        format.json { render json: @catgrupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catgrupos/1
  # DELETE /catgrupos/1.json
  def destroy
    @catgrupo.destroy
    respond_to do |format|
      format.html { redirect_to catgrupos_url, notice: 'Catgrupo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catgrupo
      @catgrupo = Catgrupo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catgrupo_params
      params.require(:catgrupo).permit(:Clave, :Descripcion, :Status, :TipoGrupo, :IdEmpresa)
    end
end
