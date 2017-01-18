class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /clientes
  # GET /clientes.json
  def index
    @cliente = Cliente.new
    @cliente.build_relclicla

    @clas1 = Clascliente.clas1_scope
    @clas2 = Clascliente.clas2_scope
    @clas3 = Clascliente.clas3_scope
    @clas4 = Clascliente.clas4_scope
    @clas5 = Clascliente.clas5_scope

      respond_to do |format|
        format.html
        format.json { render json: ClienteDatatable.new(view_context,{:from => (current_usuario.empresa_id) }) }
      end
  end

  def index2
    @clientes = Cliente.activos.por_empresa(current_usuario.empresa_id).primeros
  #  @clientes = Cliente.activos.por_empresa(current_usuario.empresa_id).primeros
    @cliente = Cliente.new
    @cliente.build_relclicla
    @cp = Codigopostal.search(params[:search]).first

    @clas1 = Clascliente.clas1_scope
    @clas2 = Clascliente.clas2_scope
    @clas3 = Clascliente.clas3_scope
    @clas4 = Clascliente.clas4_scope
    @clas5 = Clascliente.clas5_scope

    respond_to do |format|
      format.html
      format.csv { send_data @clientes.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end


  def import
    Cliente.import(params[:file])
    redirect_to clientes_path, notice: "clientes importados."
  end

  def clientes_check
    @clientex = Cliente.comprobar_existencia(params[:cliente][:IdCli]).first
    respond_to do |format|
    format.json { render :json => !@clientex }
    end
  end

  def busqueda_cp
    @cp = Codigopostal.search(params[:search]).first
    respond_to do |format|
    format.js
    end
  end

  # GET /clientes/1
  # GET /clientes/1.json
  def show
  end

  # GET /clientes/new
  def new
    @cliente = Cliente.new
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create

    @clas1 = Clascliente.clas1_scope
    @clas2 = Clascliente.clas2_scope
    @clas3 = Clascliente.clas3_scope
    @clas4 = Clascliente.clas4_scope
    @clas5 = Clascliente.clas5_scope


    @cliente = Cliente.new(cliente_params)

    respond_to do |format|
      if @cliente.save
        format.html { redirect_to @cliente, notice: 'Cliente was successfully created.' }
        format.json { render :show, status: :created, location: @cliente }
        format.js {flash.now[:notice] = 'El cliente se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el cliente.'} #ajax

      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update

    @clas1 = Clascliente.clas1_scope
    @clas2 = Clascliente.clas2_scope
    @clas3 = Clascliente.clas3_scope
    @clas4 = Clascliente.clas4_scope
    @clas5 = Clascliente.clas5_scope

    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to @cliente, notice: 'Cliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @cliente }
        format.js {flash.now[:notice] = 'El cliente se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el cliente.'} #ajax

      end
    end
  end

  # DELETE /clientes/1
  # DELETE /clientes/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to clientes_url, notice: 'Cliente was successfully destroyed.' }
      format.json { head :no_content }
      if @cliente.Status == true
        @cliente.update(Status:false)
        format.js {flash.now[:notice] = 'El cliente se ha borrado de forma exitosa.'} #ajax
      else
        @cliente.update(Status:true)
        format.js {flash.now[:notice] = 'El cliente se ha habilitado de forma exitosa.'} #ajax
      end

    end
  end

  def inactivos
    @clientes = Cliente.inactivos.por_empresa(current_usuario.empresa_id).primeros

    @clas1 = Clascliente.clas1_scope
    @clas2 = Clascliente.clas2_scope
    @clas3 = Clascliente.clas3_scope
    @clas4 = Clascliente.clas4_scope
    @clas5 = Clascliente.clas5_scope

    respond_to do |format|
      format.html
      format.csv { send_data @clientes.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cliente_params
      params.require(:cliente).permit(:IdCli, :Nombre, :NombreCorto, :Direccion, :Referencia, :Telefono, :CP, :Credito, :LimiteCredito, :Status, :DiasCreedito, :Colonia, :Tel2, :Email, :VisitaObligada, :FirmaObligada, :MotivoBajaId, :Saldo, :Horario, :idclasc, :IdEmpresa, relclicla_attributes: [:id, :IdCliente, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa])
    end
end
