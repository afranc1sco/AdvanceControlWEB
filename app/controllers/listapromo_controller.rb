class ListapromoController < ApplicationController
  before_action :set_listaprom, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /listapromo
  # GET /listapromo.json
  def index
    @listapromo = Listaprom.activos.por_empresa(current_usuario.empresa_id)
    @listaprom = Listaprom.new
    @listaprom.detallepromo.build
    @listapromomaster = Listapromomast.por_empresa(current_usuario.empresa_id)
    @listapromomast = Listapromomast.new
  end

  def promociones_check
    @promocionx = Listaprom.comprobar_existencia(params[:listaprom][:Lista]).first
    respond_to do |format|
    format.json { render :json => !@promocionx }
    end
  end

  # GET /listapromo/1
  # GET /listapromo/1.json
  def show
    @detalleprom = Detalleprom.new
  end

  # GET /listapromo/new
  def new
    @listaprom = Listaprom.new
  end

  # GET /listapromo/1/edit
  def edit
    @listaprom.detallepromo.build
    @productos = Producto.promociones_productos_por_empresa(current_usuario.empresa_id)
    @variable = Listaprom.all.count
    @cantidad_de_productosbase = Detalleprom.productosbase_count(params[:id]).count
    @cantidad_de_productosRegalo = Detalleprom.productosRegalo_count1(params[:id]).productosRegalo_count2.count

  end

  # POST /listapromo
  # POST /listapromo.json
  def create
    @listaprom = Listaprom.new(listaprom_params)

    respond_to do |format|
      if @listaprom.save
        format.html { redirect_to @listaprom, notice: 'Listaprom was successfully created.' }
        format.json { render :show, status: :created, location: @listaprom }
        format.js
      else
        format.html { render :new }
        format.json { render json: @listaprom.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # PATCH/PUT /listapromo/1
  # PATCH/PUT /listapromo/1.json
  def update
    respond_to do |format|
      if @listaprom.update(listaprom_params)
        format.html { redirect_to edit_listaprom_path(@listaprom), notice: 'Listaprom was successfully updated.' }
        format.json { render :show, status: :ok, location: @listaprom }
         format.js

    else
        format.html { render :edit }
        format.json { render json: @listaprom.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # DELETE /listapromo/1
  # DELETE /listapromo/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to listapromo_url, notice: 'Listaprom was successfully destroyed.' }
      format.json { head :no_content }
      if @listaprom.Activa == true
        @listaprom.update(Activa:false)
        format.js {flash.now[:notice] = 'La promoción se ha borrado de forma exitosa.'} #ajax
      else
        @listaprom.update(Activa:true)
        format.js {flash.now[:notice] = 'La promoción se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  def inactivos
    @listapromo = Listaprom.inactivos.por_empresa(current_usuario.empresa_id)
    @listaprom = Listaprom.new
    @listaprom.detallepromo.build
    @listapromomaster = Listapromomast.por_empresa(current_usuario.empresa_id)
    @listapromomast = Listapromomast.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listaprom
      @listaprom = Listaprom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listaprom_params
      params.require(:listaprom).permit(:Lista,:listaprom_id, :Descripcion, :Caduca, :FechaI, :FechaF, :Grupo, :Activa, :Tipo, :IdEmpresa, detallepromo_attributes: [:id, :Articulo, :Cantidad, :Tipo, :TipoProm, :Monto, :Volumen, :TipMed, :Nivel, :IdEmpresa, :_destroy ])
    end
end
