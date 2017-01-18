class FormaspagController < ApplicationController
  before_action :set_formapag, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /formaspag
  # GET /formaspag.json
  def index
    @formaspag = Formapag.activos.por_empresa(current_usuario.empresa_id)
    @formapag = Formapag.new
    respond_to do |format|
      format.html
      format.csv { send_data @formaspag.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end


  def formaspag_check
    @formapagx = Formapag.comprobar_existencia(params[:formapag][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@formapagx }
    end
  end

  # GET /formaspag/1
  # GET /formaspag/1.json
  def show
  end

  # GET /formaspag/new
  def new
    @formapag = Formapag.new
  end

  # GET /formaspag/1/edit
  def edit
  end

  # POST /formaspag
  # POST /formaspag.json
  def create
    @formapag = Formapag.new(formapag_params)

    respond_to do |format|
      if @formapag.save
        format.html { redirect_to @formapag, notice: 'Formapag was successfully created.' }
        format.json { render :show, status: :created, location: @formapag }
        format.js {flash.now[:notice] = 'La forma de pago se ha creado de forma exitosa.'} #ajax

      else
        format.html { render :new }
        format.json { render json: @formapag.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la forma de pago.'} #ajax

      end
    end
  end

  # PATCH/PUT /formaspag/1
  # PATCH/PUT /formaspag/1.json
  def update
    respond_to do |format|
      if @formapag.update(formapag_params)
        format.html { redirect_to @formapag, notice: 'Formapag was successfully updated.' }
        format.json { render :show, status: :ok, location: @formapag }
        format.js {flash.now[:notice] = 'La forma de pago se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @formapag.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la forma de pago.'} #ajax

      end
    end
  end

  # DELETE /formaspag/1
  # DELETE /formaspag/1.json
  def destroy

    respond_to do |format|
      format.html { redirect_to formaspag_url, notice: 'Formapag was successfully destroyed.' }
      format.json { head :no_content }
      if @formapag.Status == true
        @formapag.update(Status:false)
        format.js {flash.now[:notice] = 'La forma de pago se ha borrado de forma exitosa.'} #ajax
      else
        @formapag.update(Status:true)
        format.js {flash.now[:notice] = 'La forma de pago se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  def inactivos
    @formaspag = Formapag.inactivos
    @formapag = Formapag.new
    respond_to do |format|
      format.html
      format.csv { send_data @formaspag.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_formapag
      @formapag = Formapag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def formapag_params
      params.require(:formapag).permit(:Forma, :Clave, :Status, :IdEmpresa)
    end
end
