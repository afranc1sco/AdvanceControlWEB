class RelclirutasController < ApplicationController
  before_action :set_relcliruta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relclirutas
  # GET /relclirutas.json
  def ruta_clientes
    @relclirutas = Relcliruta.clientes_que_tiene(params[:id])
    @relcliruta = Relcliruta.new
    @ruta = Ruta.datos_ruta(params[:id])
    @clientes = Cliente.primeros.joins('left outer join relclirutas on clientes.IdCli=relclirutas.IdCliente')
                     .select('clientes.*,relclirutas.IdCliente')
                     .where('( relclirutas.IdRuta IS NULL OR relclirutas.IdRuta != ? ) AND clientes.Status = ? AND clientes.IdEmpresa = ? AND clientes.IdCli not in (select distinct IdCliente from relclirutas where IdRuta = ?) ', params[:id], true, current_usuario.empresa_id, params[:id])
                     .distinct



    @relcliruta.build_reldayc



    @reldayc = Reldayc.new

  end

  # GET /relclirutas/1
  # GET /relclirutas/1.json
  def show
  end

  # GET /relclirutas/new
  def new
    @relcliruta = Relcliruta.new
  end

  # GET /relclirutas/1/edit
  def edit
  end

  # POST /relclirutas
  # POST /relclirutas.json
  def create
    @relcliruta = Relcliruta.new(relcliruta_params)

    respond_to do |format|
      if @relcliruta.save
        format.html { redirect_to @relcliruta, notice: 'Relcliruta was successfully created.' }
        format.json { render :show, status: :created, location: @relcliruta }
        format.js {flash.now[:notice] = 'El cliente se ha agregado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @relcliruta.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar el cliente.'} #ajax
      end
    end
  end

  # PATCH/PUT /relclirutas/1
  # PATCH/PUT /relclirutas/1.json
  def update
    respond_to do |format|
      if @relcliruta.update(relcliruta_params)
        format.html { redirect_to @relcliruta, notice: 'Relcliruta was successfully updated.' }
        format.json { render :show, status: :ok, location: @relcliruta }
      else
        format.html { render :edit }
        format.json { render json: @relcliruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relclirutas/1
  # DELETE /relclirutas/1.json
  def destroy
    @relcliruta.destroy
    respond_to do |format|
      format.html { redirect_to relclirutas_url, notice: 'Relcliruta was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El cliente se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relcliruta
      @relcliruta = Relcliruta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relcliruta_params
      params.require(:relcliruta).permit(:IdCliente, :IdRuta, :Fecha, :IdEmpresa, reldayc_attributes: [:RutaId, :CodCli, :IdEmpresa ])
    end
end
