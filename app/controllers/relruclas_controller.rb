class RelruclasController < ApplicationController
  before_action :set_relrucla, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relruclas
  # GET /relruclas.json
  def index
    @relruclas = Relrucla.all
  end

  # GET /relruclas/1
  # GET /relruclas/1.json
  def show
  end

  # GET /relruclas/new
  def new
    @relrucla = Relrucla.new
  end

  # GET /relruclas/1/edit
  def edit
  end

  # POST /relruclas
  # POST /relruclas.json
  def create
    @relrucla = Relrucla.new(relrucla_params)

    respond_to do |format|
      if @relrucla.save
        format.html { redirect_to @relrucla, notice: 'Relrucla was successfully created.' }
        format.json { render :show, status: :created, location: @relrucla }
      else
        format.html { render :new }
        format.json { render json: @relrucla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relruclas/1
  # PATCH/PUT /relruclas/1.json
  def update
    respond_to do |format|
      if @relrucla.update(relrucla_params)
        format.html { redirect_to @relrucla, notice: 'Relrucla was successfully updated.' }
        format.json { render :show, status: :ok, location: @relrucla }
      else
        format.html { render :edit }
        format.json { render json: @relrucla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relruclas/1
  # DELETE /relruclas/1.json
  def destroy
    @relrucla.destroy
    respond_to do |format|
      format.html { redirect_to relruclas_url, notice: 'Relrucla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relrucla
      @relrucla = Relrucla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relrucla_params
      params.require(:relrucla).permit(:RutaId, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa)
    end
end
