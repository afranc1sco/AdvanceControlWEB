class CuotasController < ApplicationController
  before_action :set_cuota, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /cuotas
  # GET /cuotas.json
  def index
    @cuotas = Cuota.por_empresa(current_usuario.empresa_id)
    @cuota = Cuota.new
    respond_to do |format|
      format.html
      format.csv { send_data @cuotas.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  # GET /cuotas/1
  # GET /cuotas/1.json
  def show
  end

  # GET /cuotas/new
  def new
    @cuota = Cuota.new
  end

  # GET /cuotas/1/edit
  def edit
  end

  # POST /cuotas
  # POST /cuotas.json
  def create
    @cuota = Cuota.new(cuota_params)

    respond_to do |format|
      if @cuota.save
        format.html { redirect_to @cuota, notice: 'Cuota was successfully created.' }
        format.json { render :show, status: :created, location: @cuota }
        format.js {flash.now[:notice] = 'La cuota se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @cuota.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la cuota.'} #ajax

      end
    end
  end

  # PATCH/PUT /cuotas/1
  # PATCH/PUT /cuotas/1.json
  def update
    respond_to do |format|
      if @cuota.update(cuota_params)
        format.html { redirect_to @cuota, notice: 'Cuota was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuota }
        format.js {flash.now[:notice] = 'La cuota se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @cuota.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la cuota.'} #ajax

      end
    end
  end

  # DELETE /cuotas/1
  # DELETE /cuotas/1.json
  def destroy
    @cuota.destroy
    respond_to do |format|
      format.html { redirect_to cuotas_url, notice: 'Cuota was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La cuota se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuota
      @cuota = Cuota.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cuota_params
      params.require(:cuota).permit(:Clave, :Descripcion, :UniMed, :Cantidad, :FechaI, :FechaF, :Producto, :Tipo, :Activa, :NivelNum, :IdEmpresa)
    end
end
