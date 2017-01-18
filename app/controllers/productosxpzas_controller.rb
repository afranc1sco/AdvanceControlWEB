class ProductosxpzasController < ApplicationController
  before_action :set_productosxpza, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /productosxpzas
  # GET /productosxpzas.json
  def index
    @productosxpzas = Productosxpza.all
  end

  # GET /productosxpzas/1
  # GET /productosxpzas/1.json
  def show
  end

  # GET /productosxpzas/new
  def new
    @productosxpza = Productosxpza.new
  end

  # GET /productosxpzas/1/edit
  def edit
  end

  # POST /productosxpzas
  # POST /productosxpzas.json
  def create
    @productosxpza = Productosxpza.new(productosxpza_params)

    respond_to do |format|
      if @productosxpza.save
        format.html { redirect_to @productosxpza, notice: 'Productosxpza was successfully created.' }
        format.json { render :show, status: :created, location: @productosxpza }
      else
        format.html { render :new }
        format.json { render json: @productosxpza.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productosxpzas/1
  # PATCH/PUT /productosxpzas/1.json
  def update
    respond_to do |format|
      if @productosxpza.update(productosxpza_params)
        format.html { redirect_to @productosxpza, notice: 'Productosxpza was successfully updated.' }
        format.json { render :show, status: :ok, location: @productosxpza }
      else
        format.html { render :edit }
        format.json { render json: @productosxpza.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productosxpzas/1
  # DELETE /productosxpzas/1.json
  def destroy
    @productosxpza.destroy
    respond_to do |format|
      format.html { redirect_to productosxpzas_url, notice: 'Productosxpza was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_productosxpza
      @productosxpza = Productosxpza.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def productosxpza_params
      params.require(:productosxpza).permit(:Producto, :PzaXCja, :IdEmpresa)
    end
end
