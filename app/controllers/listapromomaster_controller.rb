class ListapromomasterController < ApplicationController
  before_action :set_listapromomast, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /listapromomaster
  # GET /listapromomaster.json
  def index
    @listapromomaster = Listapromomast.por_empresa(current_usuario.empresa_id)
  end

  # GET /listapromomaster/1
  # GET /listapromomaster/1.json
  def show
  end

  # GET /listapromomaster/new
  def new
    @listapromomast = Listapromomast.new
  end

  # GET /listapromomaster/1/edit
  def edit
  end

  # POST /listapromomaster
  # POST /listapromomaster.json
  def create
    @listapromomast = Listapromomast.new(listapromomast_params)

    respond_to do |format|
      if @listapromomast.save
        format.html { redirect_to @listapromomast, notice: 'Listapromomast was successfully created.' }
        format.json { render :show, status: :created, location: @listapromomast }
        format.js {flash.now[:notice] = 'El grupo se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @listapromomast.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el grupo.'} #ajax
      end
    end
  end

  # PATCH/PUT /listapromomaster/1
  # PATCH/PUT /listapromomaster/1.json
  def update
    respond_to do |format|
      if @listapromomast.update(listapromomast_params)
        format.html { redirect_to @listapromomast, notice: 'Listapromomast was successfully updated.' }
        format.json { render :show, status: :ok, location: @listapromomast }
        format.js {flash.now[:notice] = 'El grupo se ha actualizado de forma exitosa.'} #ajax
      else
        format.html { render :edit }
        format.json { render json: @listapromomast.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el grupo.'} #ajax
      end
    end
  end

  # DELETE /listapromomaster/1
  # DELETE /listapromomaster/1.json
  def destroy
    @listapromomast.destroy
    respond_to do |format|
      format.html { redirect_to listapromomaster_url, notice: 'Listapromomast was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El grupo se ha eliminado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listapromomast
      @listapromomast = Listapromomast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listapromomast_params
      params.require(:listapromomast).permit(:Id, :ListaMaster, :Promociones, :IdEmpresa)
    end
end
