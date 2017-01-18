class ListadController < ApplicationController
  before_action :set_slista, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /listad
  # GET /listad.json
  def index
    @listad = Slista.por_empresa(current_usuario.empresa_id)
    @slista = Slista.new
    @productos = Producto.all

    respond_to do |format|
      format.html
      format.csv { send_data @listad.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  # GET /listad/1
  # GET /listad/1.json
  def show
  end

  # GET /listad/new
  def new
    @slista = Slista.new
  end

  # GET /listad/1/edit
  def edit
  end

  # POST /listad
  # POST /listad.json
  def create
    @slista = Slista.new(slista_params)

    respond_to do |format|
      if @slista.save
        format.html { redirect_to @slista, notice: 'Slista was successfully created.' }
        format.json { render :show, status: :created, location: @slista }
        format.js {flash.now[:notice] = 'La Lista se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @slista.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la lista.'} #ajax

      end
    end
  end

  # PATCH/PUT /listad/1
  # PATCH/PUT /listad/1.json
  def update
    respond_to do |format|
      if @slista.update(slista_params)
        format.html { redirect_to @slista, notice: 'Slista was successfully updated.' }
        format.json { render :show, status: :ok, location: @slista }
        format.js {flash.now[:notice] = 'La Lista se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @slista.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la lista.'} #ajax

      end
    end
  end

  # DELETE /listad/1
  # DELETE /listad/1.json
  def destroy
    @slista.destroy
    respond_to do |format|
      format.html { redirect_to listad_url, notice: 'Slista was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La Lista se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slista
      @slista = Slista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slista_params
      params.require(:slista).permit(:Lista, :Tipo, :Caduca, :FechaIni, :FechaFin, :IdEmpresa)
    end
end
