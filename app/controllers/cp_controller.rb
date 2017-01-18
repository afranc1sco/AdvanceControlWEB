class CpController < ApplicationController
  before_action :set_codigopostal, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!
  # GET /cp
  # GET /cp.json
  def index
    @cp = Codigopostal.all
  end

  # GET /cp/1
  # GET /cp/1.json
  def show
  end

  # GET /cp/new
  def new
    @codigopostal = Codigopostal.new
  end

  # GET /cp/1/edit
  def edit
  end

  # POST /cp
  # POST /cp.json
  def create
    @codigopostal = Codigopostal.new(codigopostal_params)

    respond_to do |format|
      if @codigopostal.save
        format.html { redirect_to @codigopostal, notice: 'Codigopostal was successfully created.' }
        format.json { render :show, status: :created, location: @codigopostal }
      else
        format.html { render :new }
        format.json { render json: @codigopostal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cp/1
  # PATCH/PUT /cp/1.json
  def update
    respond_to do |format|
      if @codigopostal.update(codigopostal_params)
        format.html { redirect_to @codigopostal, notice: 'Codigopostal was successfully updated.' }
        format.json { render :show, status: :ok, location: @codigopostal }
      else
        format.html { render :edit }
        format.json { render json: @codigopostal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cp/1
  # DELETE /cp/1.json
  def destroy
    @codigopostal.destroy
    respond_to do |format|
      format.html { redirect_to cp_url, notice: 'Codigopostal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_codigopostal
      @codigopostal = Codigopostal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def codigopostal_params
      params.require(:codigopostal).permit(:CP, :Colonia, :Municipio, :Estado, :Ciudad)
    end
end
