class CatbancosController < ApplicationController
  before_action :set_catbanco, only: [:show, :edit, :update, :destroy]

  # GET /catbancos
  # GET /catbancos.json
  def index
    @catbancos = Catbanco.activos.por_empresa(current_usuario.empresa_id)
    @catbanco = Catbanco.new
  end

  def inactivos
    @catbancos = Catbanco.inactivos.por_empresa(current_usuario.empresa_id)
  end
  # GET /catbancos/1
  # GET /catbancos/1.json
  def show
  end

  # GET /catbancos/new
  def new
    @catbanco = Catbanco.new
  end

  # GET /catbancos/1/edit
  def edit
  end

  # POST /catbancos
  # POST /catbancos.json
  def create
    @catbanco = Catbanco.new(catbanco_params)

    respond_to do |format|
      if @catbanco.save
        format.html { redirect_to @catbanco, notice: 'Catbanco was successfully created.' }
        format.json { render :show, status: :created, location: @catbanco }
        format.js {flash.now[:notice] = 'El banco se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @catbanco.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el banco.'} #ajax
      end
    end
  end

  # PATCH/PUT /catbancos/1
  # PATCH/PUT /catbancos/1.json
  def update
    respond_to do |format|
      if @catbanco.update(catbanco_params)
        format.html { redirect_to @catbanco, notice: 'Catbanco was successfully updated.' }
        format.json { render :show, status: :ok, location: @catbanco }
        format.js {flash.now[:notice] = 'El banco se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @catbanco.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el banco.'} #ajax
      end
    end
  end

  # DELETE /catbancos/1
  # DELETE /catbancos/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to catbancos_url, notice: 'Catbanco was successfully destroyed.' }
      format.json { head :no_content }
      if @catbanco.Status == true
        @catbanco.update(Status:false)
        format.js {flash.now[:notice] = 'El banco se ha borrado de forma exitosa.'} #ajax
      else
        @catbanco.update(Status:true)
        format.js {flash.now[:notice] = 'El banco se ha habilitado de forma exitosa.'} #ajax
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catbanco
      @catbanco = Catbanco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catbanco_params
      params.require(:catbanco).permit(:Clave, :Descripcion, :Status, :IdEmpresa)
    end
end
