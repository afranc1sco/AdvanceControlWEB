class SecrutasController < ApplicationController
  before_action :set_secruta, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /secrutas
  # GET /secrutas.json
  def index
    @secrutas = Secruta.all
  end

  # GET /secrutas/1
  # GET /secrutas/1.json
  def show
  end

  # GET /secrutas/new
  def new
    @secruta = Secruta.new
  end

  # GET /secrutas/1/edit
  def edit
  end

  # POST /secrutas
  # POST /secrutas.json
  def create
    @secruta = Secruta.new(secruta_params)

    respond_to do |format|
      if @secruta.save
        format.html { redirect_to @secruta, notice: 'Secruta was successfully created.' }
        format.json { render :show, status: :created, location: @secruta }
      else
        format.html { render :new }
        format.json { render json: @secruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /secrutas/1
  # PATCH/PUT /secrutas/1.json
  def update
    respond_to do |format|
      if @secruta.update(secruta_params)
        format.html { redirect_to @secruta, notice: 'Secruta was successfully updated.' }
        format.json { render :show, status: :ok, location: @secruta }
      else
        format.html { render :edit }
        format.json { render json: @secruta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /secrutas/1
  # DELETE /secrutas/1.json
  def destroy
    @secruta.destroy
    respond_to do |format|
      format.html { redirect_to secrutas_url, notice: 'Secruta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secruta
      @secruta = Secruta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secruta_params
      params.require(:secruta).permit(:Rutad, :Lunes, :Martes, :Miercoles, :Jueves, :Viernes, :Sabado, :Domingo, :IdEmpresa)
    end
end
