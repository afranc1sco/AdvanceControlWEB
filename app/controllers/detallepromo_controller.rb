class DetallepromoController < ApplicationController
  before_action :set_detalleprom, only: [:show, :edit, :update, :destroy]
  before_action :set_listaprom
  before_action :authenticate_usuario!

  # GET /detallepromo
  # GET /detallepromo.json
  def index
    @detallepromo = Detalleprom.all
  end

  # GET /detallepromo/1
  # GET /detallepromo/1.json
  def show
  end

  # GET /detallepromo/new
  def new
    @detalleprom = Detalleprom.new
  end

  # GET /detallepromo/1/edit
  def edit
  end

  # POST /detallepromo
  # POST /detallepromo.json
  def create
    @detalleprom = Detalleprom.new(detalleprom_params)
    @detalleprom.listaprom = @listaprom

    respond_to do |format|
      if @detalleprom.save
        format.html { redirect_to @detalleprom.listaprom, notice: 'Detalleprom was successfully created.' }
        format.json { render :show, status: :created, location: @detalleprom }
        format.js #ajax
      else
        format.html { render :new }
        format.json { render json: @detalleprom.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # PATCH/PUT /detallepromo/1
  # PATCH/PUT /detallepromo/1.json
  def update
    respond_to do |format|
      if @detalleprom.update(detalleprom_params)
        format.html { redirect_to @detalleprom.listaprom, notice: 'Detalleprom was successfully updated.' }
        format.json { render :show, status: :ok, location: @detalleprom }
        format.js #ajax
      else
        format.html { render :edit }
        format.json { render json: @detalleprom.errors, status: :unprocessable_entity }
        format.js #ajax
      end
    end
  end

  # DELETE /detallepromo/1
  # DELETE /detallepromo/1.json
  def destroy
    @detalleprom.destroy
    respond_to do |format|
      format.html { redirect_to detallepromo_url, notice: 'Detalleprom was successfully destroyed.' }
      format.json { head :no_content }
      format.js #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listaprom
      @listaprom = Listaprom.find(params[:listaprom_id])
    end

    def set_detalleprom
      @detalleprom = Detalleprom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detalleprom_params
      params.require(:detalleprom).permit(:Articulo, :listaprom_id, :PromoId, :Cantidad, :Tipo, :TipoProm, :Monto, :Volumen, :TipMed, :IdEmpresa, :Nivel)
    end
end
