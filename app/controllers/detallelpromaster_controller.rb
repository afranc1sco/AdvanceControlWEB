class DetallelpromasterController < ApplicationController
  before_action :set_detallelpromast, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /detallelpromaster
  # GET /detallelpromaster.json
  def index
    @detallelpromaster = Detallelpromast.promocionesquetiene(params[:id])
    @Listapromo = Listaprom.por_empresa(current_usuario.empresa_id)
    @detallelpromast = Detallelpromast.new
  end

  # GET /detallelpromaster/1
  # GET /detallelpromaster/1.json
  def show
  end

  # GET /detallelpromaster/new
  def new
    @detallelpromast = Detallelpromast.new
  end

  # GET /detallelpromaster/1/edit
  def edit
  end

  # POST /detallelpromaster
  # POST /detallelpromaster.json
  def create
    @detallelpromast = Detallelpromast.new(detallelpromast_params)

    respond_to do |format|
      if @detallelpromast.save
        format.html { redirect_to @detallelpromast, notice: 'Detallelpromast was successfully created.' }
        format.json { render :show, status: :created, location: @detallelpromast }
        format.js {flash.now[:notice] = 'La promoción se ha agregado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @detallelpromast.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al agregar la promoción.'} #ajax
      end
    end
  end

  # PATCH/PUT /detallelpromaster/1
  # PATCH/PUT /detallelpromaster/1.json
  def update
    respond_to do |format|
      if @detallelpromast.update(detallelpromast_params)
        format.html { redirect_to @detallelpromast, notice: 'Detallelpromast was successfully updated.' }
        format.json { render :show, status: :ok, location: @detallelpromast }
        format.js {flash.now[:notice] = 'La promoción se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @detallelpromast.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la promoción.'} #ajax
      end
    end
  end

  # DELETE /detallelpromaster/1
  # DELETE /detallelpromaster/1.json
  def destroy
    @detallelpromast.destroy
    respond_to do |format|
      format.html { redirect_to detallelpromaster_url, notice: 'Detallelpromast was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La promoción se ha quitado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detallelpromast
      @detallelpromast = Detallelpromast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detallelpromast_params
      params.require(:detallelpromast).permit(:IdLm, :IdPromo, :IdEmpresa)
    end
end
