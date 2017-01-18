class ThComisionController < ApplicationController
  before_action :set_comision, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /th_comision
  # GET /th_comision.json
  def index
    @th_comision = Comision.por_empresa(current_usuario.empresa_id).activos
    @comision = Comision.new
    respond_to do |format|
      format.html
      format.csv { send_data @th_comision.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def inactivos
    @th_comision = Comision.por_empresa(current_usuario.empresa_id).inactivos
    respond_to do |format|
      format.html
      format.csv { send_data @th_comision.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  # GET /th_comision/1
  # GET /th_comision/1.json
  def show
  end

  # GET /th_comision/new
  def new
    @comision = Comision.new
  end

  # GET /th_comision/1/edit
  def edit
  end

  # POST /th_comision
  # POST /th_comision.json
  def create
    @comision = Comision.new(comision_params)

    respond_to do |format|
      if @comision.save
        format.html { redirect_to @comision, notice: 'Comision was successfully created.' }
        format.json { render :show, status: :created, location: @comision }
        format.js {flash.now[:notice] = 'La comisión se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @comision.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la comisión.'} #ajax

      end
    end
  end

  # PATCH/PUT /th_comision/1
  # PATCH/PUT /th_comision/1.json
  def update
    respond_to do |format|
      if @comision.update(comision_params)
        format.html { redirect_to @comision, notice: 'Comision was successfully updated.' }
        format.json { render :show, status: :ok, location: @comision }
        format.js {flash.now[:notice] = 'La comisión se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @comision.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la comisión.'} #ajax
      end
    end
  end

  # DELETE /th_comision/1
  # DELETE /th_comision/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to th_comision_url, notice: 'Comision was successfully destroyed.' }
      format.json { head :no_content }
      if @comision.Status == "A"
        @comision.update(Status:"I")
        format.js {flash.now[:notice] = 'La comisión se ha borrado de forma exitosa.'} #ajax
      else
        @comision.update(Status:"A")
        format.js {flash.now[:notice] = 'La comisión se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comision
      @comision = Comision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comision_params
      params.require(:comision).permit(:Status, :Comentarios, :IdEmpresa, :ID_Producto)
    end
end
