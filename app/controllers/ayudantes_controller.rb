class AyudantesController < ApplicationController
  before_action :set_ayudante, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /ayudantes
  # GET /ayudantes.json
  def index
    @ayudantes = Ayudante.all
  end

  # GET /ayudantes/1
  # GET /ayudantes/1.json
  def show
  end

  # GET /ayudantes/new
  def new
    @ayudante = Ayudante.new
  end

  # GET /ayudantes/1/edit
  def edit
  end

  # POST /ayudantes
  # POST /ayudantes.json
  def create
    @ayudante = Ayudante.new(ayudante_params)

    respond_to do |format|
      if @ayudante.save
        format.html { redirect_to @ayudante, notice: 'Ayudante was successfully created.' }
        format.json { render :show, status: :created, location: @ayudante }
      else
        format.html { render :new }
        format.json { render json: @ayudante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ayudantes/1
  # PATCH/PUT /ayudantes/1.json
  def update
    respond_to do |format|
      if @ayudante.update(ayudante_params)
        format.html { redirect_to @ayudante, notice: 'Ayudante was successfully updated.' }
        format.json { render :show, status: :ok, location: @ayudante }
      else
        format.html { render :edit }
        format.json { render json: @ayudante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ayudantes/1
  # DELETE /ayudantes/1.json
  def destroy
    @ayudante.destroy
    respond_to do |format|
      format.html { redirect_to ayudantes_url, notice: 'Ayudante was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ayudante
      @ayudante = Ayudante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ayudante_params
      params.require(:ayudante).permit(:nombre, :direccion, :telefono, :status, :numlicencia, :vencelic, :clave)
    end
end
