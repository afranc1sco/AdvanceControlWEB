class MvomermaController < ApplicationController
  before_action :set_mvmerma, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /mvomerma
  # GET /mvomerma.json
  def index
    @mvomerma = Mvmerma.activos.por_empresa(current_usuario.empresa_id)
    @mvmerma = Mvmerma.new
    respond_to do |format|
      format.html
      format.csv { send_data @mvomerma.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def inactivos
    @mvomerma = Mvmerma.inactivos
    respond_to do |format|
      format.html
      format.csv { send_data @mvomerma.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def mvomerma_check
    @mvmermax = Mvmerma.comprobar_existencia(params[:mvmerma][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@mvmermax }
    end
  end

  # GET /mvomerma/1
  # GET /mvomerma/1.json
  def show
  end

  # GET /mvomerma/new
  def new
    @mvmerma = Mvmerma.new
  end

  # GET /mvomerma/1/edit
  def edit
  end

  # POST /mvomerma
  # POST /mvomerma.json
  def create
    @mvmerma = Mvmerma.new(mvmerma_params)

    respond_to do |format|
      if @mvmerma.save
        format.html { redirect_to @mvmerma, notice: 'Mvmerma was successfully created.' }
        format.json { render :show, status: :created, location: @mvmerma }
        format.js {flash.now[:notice] = 'El motivo se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @mvmerma.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el motivo.'} #ajax

      end
    end
  end

  # PATCH/PUT /mvomerma/1
  # PATCH/PUT /mvomerma/1.json
  def update
    respond_to do |format|
      if @mvmerma.update(mvmerma_params)
        format.html { redirect_to @mvmerma, notice: 'Mvmerma was successfully updated.' }
        format.json { render :show, status: :ok, location: @mvmerma }
        format.js {flash.now[:notice] = 'el motivo se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @mvmerma.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el motivo.'} #ajax

      end
    end
  end

  # DELETE /mvomerma/1
  # DELETE /mvomerma/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to mvomerma_url, notice: 'Mvmerma was successfully destroyed.' }
      format.json { head :no_content }

      if @mvmerma.Status == true
        @mvmerma.update(Status:false)
        format.js {flash.now[:notice] = 'El motivo se ha borrado de forma exitosa.'} #ajax
      else
        @mvmerma.update(Status:true)
        format.js {flash.now[:notice] = 'El motivo se ha habilitado de forma exitosa.'} #ajax
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mvmerma
      @mvmerma = Mvmerma.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mvmerma_params
      params.require(:mvmerma).permit(:Merma, :Clave, :Status, :IdEmpresa)
    end
end
