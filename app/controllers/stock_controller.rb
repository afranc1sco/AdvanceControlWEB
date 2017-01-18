class StockController < ApplicationController
  before_action :set_stoc, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /stock
  # GET /stock.json
  def index
    @stoc = Stoc.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  def obtener_ruta
    respond_to do |format|
      format.html { redirect_to generar_stock_path(stoc_params[:Ruta]) } #envio de parametros que se usaran para enviar el la ruta
    end
  end

  def generar_stock
    @stoc = Stoc.new
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @stock = Stoc.por_ruta(params[:id])


    @productos = Producto.joins('left outer join stock on productos.Clave=stock.Articulo')
                     .select('productos.Clave,productos.Producto,stock.Articulo')
                     .where('( stock.ruta IS NULL OR stock.ruta != ? ) AND productos.Status = ? AND productos.IdEmpresa = ? AND productos.clave not in (select distinct articulo from stock where ruta = ?) ', params[:id], "A", current_usuario.empresa_id, params[:id])
                     .distinct

   @productos.each do |producto|
     Stoc.create(Articulo: producto.Clave, Ruta:params[:id], Stock: 0, IdEmpresa:current_usuario.empresa_id)
    end

  end

  # GET /stock/1
  # GET /stock/1.json
  def show
  end

  # GET /stock/new
  def new
    @stoc = Stoc.new
  end

  # GET /stock/1/edit
  def edit
  end

  # POST /stock
  # POST /stock.json
  def create
    @stoc = Stoc.new(stoc_params)

    respond_to do |format|
      if @stoc.save
        format.html { redirect_to @stoc, notice: 'Stoc was successfully created.' }
        format.json { render :show, status: :created, location: @stoc }
      else
        format.html { render :new }
        format.json { render json: @stoc.errors, status: :unprocessable_entity }
      end
    end
  end



  # PATCH/PUT /stock/1
  # PATCH/PUT /stock/1.json
  def update
    respond_to do |format|
      if @stoc.update(stoc_params)

          @pzas = (@stoc.producto.productosxpza.PzaXCja * (params[:f_cajas]).to_f) + (params[:f_piezas]).to_f # .to_f para pasar los parametros de string a integer
           @stoc.update(Stock:@pzas)

        format.html { redirect_to @stoc, notice: 'Stoc was successfully updated.' }
        format.json { render :show, status: :ok, location: @stoc }
        format.js {flash.now[:notice] = 'El stock se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @stoc.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el stock.'} #ajax
      end
    end
  end

  # DELETE /stock/1
  # DELETE /stock/1.json
  def destroy
    @stoc.destroy
    respond_to do |format|
      format.html { redirect_to stock_url, notice: 'Stoc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stoc
      @stoc = Stoc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stoc_params
      params.require(:stoc).permit(:Articulo, :Stock, :Ruta, :IdEmpresa)
    end
end
