class ContinuidadController < ApplicationController
  before_action :set_continuid, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /continuidad
  # GET /continuidad.json
  def index
    @continuidad = Continuid.all
  end

  # GET /continuidad/1
  # GET /continuidad/1.json
  def show
  end

  # GET /continuidad/new
  def new
    @continuid = Continuid.new
  end

  # GET /continuidad/1/edit
  def edit
  end

  # POST /continuidad
  # POST /continuidad.json
  def create
    @continuid = Continuid.new(continuid_params)

    respond_to do |format|
      if @continuid.save
        format.html { redirect_to @continuid, notice: 'Continuid was successfully created.' }
        format.json { render :show, status: :created, location: @continuid }
      else
        format.html { render :new }
        format.json { render json: @continuid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /continuidad/1
  # PATCH/PUT /continuidad/1.json
  def update
    respond_to do |format|
      if @continuid.update(continuid_params)
        format.html { redirect_to @continuid, notice: 'Continuid was successfully updated.' }
        format.json { render :show, status: :ok, location: @continuid }
      else
        format.html { render :edit }
        format.json { render json: @continuid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /continuidad/1
  # DELETE /continuidad/1.json
  def destroy
    @continuid.destroy
    respond_to do |format|
      format.html { redirect_to continuidad_url, notice: 'Continuid was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_continuid
      @continuid = Continuid.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def continuid_params
      params.require(:continuid).permit(:RutaID, :DiaO, :FolVta, :FolPed, :FolDevol, :FolCob, :UDiaO, :CteNvo, :IdEmpresa)
    end
end
