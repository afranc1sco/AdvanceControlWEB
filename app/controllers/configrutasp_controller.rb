class ConfigrutaspController < ApplicationController
  before_action :set_configruta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /configrutasp
  # GET /configrutasp.json
  def index
    @configrutasp = Configruta.all
  end

  # GET /configrutasp/1
  # GET /configrutasp/1.json
  def show
  end

  # GET /configrutasp/new
  def new
    @configruta = Configruta.new
  end

  # GET /configrutasp/1/edit
  def edit
  end

  # POST /configrutasp
  # POST /configrutasp.json
  def create
    @configruta = Configruta.new(configruta_params)

    respond_to do |format|
      if @configruta.save
        format.html { redirect_to @configruta, notice: 'Configruta was successfully created.' }
        format.json { render :show, status: :created, location: @configruta }
      else
        format.html { render :new }
        format.json { render json: @configruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /configrutasp/1
  # PATCH/PUT /configrutasp/1.json
  def update
    respond_to do |format|
      if @configruta.update(configruta_params)
        format.html { redirect_to @configruta, notice: 'Configruta was successfully updated.' }
        format.json { render :show, status: :ok, location: @configruta }
      else
        format.html { render :edit }
        format.json { render json: @configruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /configrutasp/1
  # DELETE /configrutasp/1.json
  def destroy
    @configruta.destroy
    respond_to do |format|
      format.html { redirect_to configrutasp_url, notice: 'Configruta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_configruta
      @configruta = Configruta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def configruta_params
      params.require(:configruta).permit(:RutaId, :ModelPrinter, :VelCom, :COM, :Server, :Puerto, :ServerGPS, :GPS, :PuertoG, :PagoContado, :CteNvo, :CveCteNvo, :IdEmpresa, :SugerirCant, :PromoEq)
    end
end
