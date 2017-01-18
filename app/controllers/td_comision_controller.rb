class TdComisionController < ApplicationController
  before_action :set_tdcomision, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /td_comision
  # GET /td_comision.json
  def index
    @td_comision = Tdcomision.detalles_de_la_comision(params[:id])
    @tdcomision = Tdcomision.new
  end

  # GET /td_comision/1
  # GET /td_comision/1.json
  def show
  end

  # GET /td_comision/new
  def new
    @tdcomision = Tdcomision.new
  end

  # GET /td_comision/1/edit
  def edit
  end

  # POST /td_comision
  # POST /td_comision.json
  def create
    @tdcomision = Tdcomision.new(tdcomision_params)

    respond_to do |format|
      if @tdcomision.save
        format.html { redirect_to @tdcomision, notice: 'Tdcomision was successfully created.' }
        format.json { render :show, status: :created, location: @tdcomision }
        format.js {flash.now[:notice] = 'El detalle se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @tdcomision.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el detalle.'} #ajax

      end
    end
  end

  # PATCH/PUT /td_comision/1
  # PATCH/PUT /td_comision/1.json
  def update
    respond_to do |format|
      if @tdcomision.update(tdcomision_params)
        format.html { redirect_to @tdcomision, notice: 'Tdcomision was successfully updated.' }
        format.json { render :show, status: :ok, location: @tdcomision }
        format.js {flash.now[:notice] = 'El detalle se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @tdcomision.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el detalle.'} #ajax

      end
    end
  end

  # DELETE /td_comision/1
  # DELETE /td_comision/1.json
  def destroy
    @tdcomision.destroy
    respond_to do |format|
      format.html { redirect_to td_comision_url, notice: 'Tdcomision was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El detalle se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tdcomision
      @tdcomision = Tdcomision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tdcomision_params
      params.require(:tdcomision).permit(:ID_Detalle, :ID_Comision, :RangoIni, :RangoFin, :Angente, :Ayudante, :Tipo, :IdEmpresa)
    end
end
