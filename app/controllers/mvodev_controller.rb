class MvodevController < ApplicationController
  before_action :set_mvodevolucion, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /mvodev
  # GET /mvodev.json
  def index
    @mvodev = Mvodevolucion.activos.por_empresa(current_usuario.empresa_id)
    @mvodevolucion = Mvodevolucion.new
    respond_to do |format|
      format.html
      format.csv { send_data @mvodev.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def inactivos
    @mvodev = Mvodevolucion.inactivos
    respond_to do |format|
      format.html
      format.csv { send_data @mvodev.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end


  def mvodev_check
    @mvodevolucionx = Mvodevolucion.comprobar_existencia(params[:mvodevolucion][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@mvodevolucionx }
    end
  end

  # GET /mvodev/1
  # GET /mvodev/1.json
  def show
  end

  # GET /mvodev/new
  def new
    @mvodevolucion = Mvodevolucion.new
  end

  # GET /mvodev/1/edit
  def edit
  end

  # POST /mvodev
  # POST /mvodev.json
  def create
    @mvodevolucion = Mvodevolucion.new(mvodevolucion_params)

    respond_to do |format|
      if @mvodevolucion.save
        format.html { redirect_to @mvodevolucion, notice: 'Mvodevolucion was successfully created.' }
        format.json { render :show, status: :created, location: @mvodevolucion }
        format.js {flash.now[:notice] = 'El motivo se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @mvodevolucion.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el motivo.'} #ajax

      end
    end
  end

  # PATCH/PUT /mvodev/1
  # PATCH/PUT /mvodev/1.json
  def update
    respond_to do |format|
      if @mvodevolucion.update(mvodevolucion_params)
        format.html { redirect_to @mvodevolucion, notice: 'Mvodevolucion was successfully updated.' }
        format.json { render :show, status: :ok, location: @mvodevolucion }
        format.js {flash.now[:notice] = 'El motivo se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @mvodevolucion.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar El motivo.'} #ajax

      end
    end
  end

  # DELETE /mvodev/1
  # DELETE /mvodev/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to mvodev_url, notice: 'Mvodevolucion was successfully destroyed.' }
      format.json { head :no_content }
      if @mvodevolucion.Status == true
        @mvodevolucion.update(Status:false)
        format.js {flash.now[:notice] = 'El motivo se ha borrado de forma exitosa.'} #ajax
      else
        @mvodevolucion.update(Status:true)
        format.js {flash.now[:notice] = 'El motivo se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mvodevolucion
      @mvodevolucion = Mvodevolucion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mvodevolucion_params
      params.require(:mvodevolucion).permit(:MvoDev, :Clave, :Status, :IdEmpresa)
    end
end
