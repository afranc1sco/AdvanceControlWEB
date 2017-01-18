class RelclilisController < ApplicationController
  before_action :set_relclili, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relclilis
  # GET /relclilis.json
  def index
    @relclilis = Relclili.clienteslistad(params[:id])
    @relclili = Relclili.new
    @clientes = Cliente.por_empresa(current_usuario.empresa_id).primeros
  end

  def indexlistap
    @relclilis = Relclili.clienteslistap(params[:id])
    @relclili = Relclili.new
    @clientes = Cliente.por_empresa(current_usuario.empresa_id).primeros
  end

  def clientes_promociones
    @relclilis = Relclili.clientespromociones(params[:id])
    @relclili = Relclili.new
    @clientes = Cliente.por_empresa(current_usuario.empresa_id).primeros
    @grupo = Listapromomast.nombre_grupo(params[:id])

  end

  # GET /relclilis/1
  # GET /relclilis/1.json
  def show
  end

  # GET /relclilis/new
  def new
    @relclili = Relclili.new
  end

  # GET /relclilis/1/edit
  def edit
  end

  # POST /relclilis
  # POST /relclilis.json
  def create
    @relclili = Relclili.new(relclili_params)

    respond_to do |format|
      if @relclili.save
        format.html { redirect_to @relclili, notice: 'Relclili was successfully created.' }
        format.json { render :show, status: :created, location: @relclili }
        format.js {flash.now[:notice] = 'El cliente se ha agregado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @relclili.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el cliente.'} #ajax

      end
    end
  end

  # PATCH/PUT /relclilis/1
  # PATCH/PUT /relclilis/1.json
  def update
    respond_to do |format|
      if @relclili.update(relclili_params)
        format.html { redirect_to @relclili, notice: 'Relclili was successfully updated.' }
        format.json { render :show, status: :ok, location: @relclili }
        format.js {flash.now[:notice] = 'Se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @relclili.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar.'} #ajax

      end
    end
  end

  # DELETE /relclilis/1
  # DELETE /relclilis/1.json
  def destroy
    @relclili.destroy
    respond_to do |format|
      format.html { redirect_to relclilis_url, notice: 'Relclili was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El cliente se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relclili
      @relclili = Relclili.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relclili_params
      params.require(:relclili).permit(:CodCliente, :ListaP, :ListaD, :ListaPromo, :IdEmpresa)
    end
end
