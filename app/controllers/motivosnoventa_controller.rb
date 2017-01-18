class MotivosnoventaController < ApplicationController
  before_action :set_motivonoventa, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /motivosnoventa
  # GET /motivosnoventa.json
  def index
    @motivosnoventa = Motivonoventa.activos
    @motivonoventa = Motivonoventa.new
    respond_to do |format|
      format.html
      format.csv { send_data @motivosnoventa.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def inactivos
    @motivosnoventa = Motivonoventa.inactivos
    respond_to do |format|
      format.html
      format.csv { send_data @motivosnoventa.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def motivosnoventa_check
    @motivonoventax = Motivonoventa.comprobar_existencia(params[:motivonoventa][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@motivonoventax }
    end
  end

  # GET /motivosnoventa/1
  # GET /motivosnoventa/1.json
  def show
  end

  # GET /motivosnoventa/new
  def new
    @motivonoventa = Motivonoventa.new
  end

  # GET /motivosnoventa/1/edit
  def edit
  end

  # POST /motivosnoventa
  # POST /motivosnoventa.json
  def create
    @motivonoventa = Motivonoventa.new(motivonoventa_params)

    respond_to do |format|
      if @motivonoventa.save
        format.html { redirect_to @motivonoventa, notice: 'Motivonoventa was successfully created.' }
        format.json { render :show, status: :created, location: @motivonoventa }
        format.js {flash.now[:notice] = 'El motivo se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @motivonoventa.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el motivo.'} #ajax

      end
    end
  end

  # PATCH/PUT /motivosnoventa/1
  # PATCH/PUT /motivosnoventa/1.json
  def update
    respond_to do |format|
      if @motivonoventa.update(motivonoventa_params)
        format.html { redirect_to @motivonoventa, notice: 'Motivonoventa was successfully updated.' }
        format.json { render :show, status: :ok, location: @motivonoventa }
        format.js {flash.now[:notice] = 'El motivo se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @motivonoventa.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el motivo.'} #ajax

      end
    end
  end

  # DELETE /motivosnoventa/1
  # DELETE /motivosnoventa/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to motivosnoventa_url, notice: 'Motivonoventa was successfully destroyed.' }
      format.json { head :no_content }

      if @motivonoventa.Status == true
        @motivonoventa.update(Status:false)
        format.js {flash.now[:notice] = 'El motivo se ha borrado de forma exitosa.'} #ajax
      else
        @motivonoventa.update(Status:true)
        format.js {flash.now[:notice] = 'El motivo se ha habilitado de forma exitosa.'} #ajax
      end



    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motivonoventa
      @motivonoventa = Motivonoventa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motivonoventa_params
      params.require(:motivonoventa).permit(:Motivo, :Clave, :Status)
    end
end
