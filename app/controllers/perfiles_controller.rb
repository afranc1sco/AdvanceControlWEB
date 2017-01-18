class PerfilesController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /perfiles
  # GET /perfiles.json
  def index
    @perfiles = Perfil.all
  end

  # GET /perfiles/1
  # GET /perfiles/1.json
  def show
  end

  # GET /perfiles/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfiles/1/edit
  def edit
  end

  # POST /perfiles
  # POST /perfiles.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to @perfil, notice: 'Perfil was successfully created.' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfiles/1
  # PATCH/PUT /perfiles/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to @perfil, notice: 'Perfil was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfiles/1
  # DELETE /perfiles/1.json
  def destroy
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfiles_url, notice: 'Perfil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit(:Altas, :Bajas, :Modi, :Listar, :Modulo, :IdUser, :Aceso, :Codigo, :usaPW, :Otro, :Descripcion)
    end
end
