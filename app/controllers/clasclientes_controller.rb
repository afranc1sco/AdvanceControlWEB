class ClasclientesController < ApplicationController
  before_action :set_clascliente, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /clasclientes
  # GET /clasclientes.json
  def index
    @clasclientes = Clascliente.all
    @clascliente = Clascliente.new
  end

  # GET /clasclientes/1
  # GET /clasclientes/1.json
  def show
  end

  # GET /clasclientes/new
  def new
    @clascliente = Clascliente.new
  end

  # GET /clasclientes/1/edit
  def edit
  end

  # POST /clasclientes
  # POST /clasclientes.json
  def create
    @clascliente = Clascliente.new(clascliente_params)

    respond_to do |format|
      if @clascliente.save
        format.html { redirect_to @clascliente, notice: 'Clascliente was successfully created.' }
        format.json { render :show, status: :created, location: @clascliente }
        format.js {flash.now[:notice] = 'La clasificación se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @clascliente.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear la clasificación.'} #ajax
      end
    end
  end

  # PATCH/PUT /clasclientes/1
  # PATCH/PUT /clasclientes/1.json
  def update
    respond_to do |format|
      if @clascliente.update(clascliente_params)
        format.html { redirect_to @clascliente, notice: 'Clascliente was successfully updated.' }
        format.json { render :show, status: :ok, location: @clascliente }
        format.js {flash.now[:notice] = 'La clasificación se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @clascliente.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar la clasificación.'} #ajax
      end
    end
  end

  # DELETE /clasclientes/1
  # DELETE /clasclientes/1.json
  def destroy
    @clascliente.destroy
    respond_to do |format|
      format.html { redirect_to clasclientes_url, notice: 'Clascliente was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'La clasificación se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clascliente
      @clascliente = Clascliente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clascliente_params
      params.require(:clascliente).permit(:IdClasC, :Descripcion, :NivelNum)
    end
end
