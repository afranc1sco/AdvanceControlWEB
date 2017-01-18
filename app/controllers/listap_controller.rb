class ListapController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /listap
  # GET /listap.json
  def index
    @listap = List.por_empresa(current_usuario.empresa_id)
    @list = List.new
    respond_to do |format|
      format.html
      format.csv { send_data @listap.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  # GET /listap/1
  # GET /listap/1.json
  def show
  end

  # GET /listap/new
  def new
    @list = List.new
  end

  # GET /listap/1/edit
  def edit
  end

  # POST /listap
  # POST /listap.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
        format.js {flash.now[:notice] = 'La lista se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la lista.'} #ajax

      end
    end
  end

  # PATCH/PUT /listap/1
  # PATCH/PUT /listap/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
        format.js {flash.now[:notice] = 'La lista se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la lista.'} #ajax

      end
    end
  end

  # DELETE /listap/1
  # DELETE /listap/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to listap_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La lista se ha borrado de forma exitosa.'} #ajax

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:Lista, :Tipo, :FechaIni, :FechaFin, :IdEmpresa)
    end
end
