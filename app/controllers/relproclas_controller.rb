class RelproclasController < ApplicationController
  before_action :set_relprocla, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relproclas
  # GET /relproclas.json
  def index
    @relproclas = Relprocla.all
  end

  # GET /relproclas/1
  # GET /relproclas/1.json
  def show
  end

  # GET /relproclas/new
  def new
    @relprocla = Relprocla.new
  end

  # GET /relproclas/1/edit
  def edit
  end

  # POST /relproclas
  # POST /relproclas.json
  def create
    @relprocla = Relprocla.new(relprocla_params)

    respond_to do |format|
      if @relprocla.save
        format.html { redirect_to @relprocla, notice: 'Relprocla was successfully created.' }
        format.json { render :show, status: :created, location: @relprocla }
      else
        format.html { render :new }
        format.json { render json: @relprocla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relproclas/1
  # PATCH/PUT /relproclas/1.json
  def update
    respond_to do |format|
      if @relprocla.update(relprocla_params)
        format.html { redirect_to @relprocla, notice: 'Relprocla was successfully updated.' }
        format.json { render :show, status: :ok, location: @relprocla }
      else
        format.html { render :edit }
        format.json { render json: @relprocla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relproclas/1
  # DELETE /relproclas/1.json
  def destroy
    @relprocla.destroy
    respond_to do |format|
      format.html { redirect_to relproclas_url, notice: 'Relprocla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relprocla
      @relprocla = Relprocla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relprocla_params
      params.require(:relprocla).permit(:ProductoId, :ClasiF, :Nivel, :Dep_Clasif, :Dep_Nivel, :IdEmpresa)
    end
end
