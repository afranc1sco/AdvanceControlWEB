class RelcliclasController < ApplicationController
  before_action :set_relclicla, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /relcliclas
  # GET /relcliclas.json
  def index
    @relcliclas = Relclicla.all
  end

  # GET /relcliclas/1
  # GET /relcliclas/1.json
  def show
  end

  # GET /relcliclas/new
  def new
    @relclicla = Relclicla.new
  end

  # GET /relcliclas/1/edit
  def edit
  end

  # POST /relcliclas
  # POST /relcliclas.json
  def create
    @relclicla = Relclicla.new(relclicla_params)

    respond_to do |format|
      if @relclicla.save
        format.html { redirect_to @relclicla, notice: 'Relclicla was successfully created.' }
        format.json { render :show, status: :created, location: @relclicla }
      else
        format.html { render :new }
        format.json { render json: @relclicla.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /relcliclas/1
  # PATCH/PUT /relcliclas/1.json
  def update
    respond_to do |format|
      if @relclicla.update(relclicla_params)
        format.html { redirect_to @relclicla, notice: 'Relclicla was successfully updated.' }
        format.json { render :show, status: :ok, location: @relclicla }
      else
        format.html { render :edit }
        format.json { render json: @relclicla.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /relcliclas/1
  # DELETE /relcliclas/1.json
  def destroy
    @relclicla.destroy
    respond_to do |format|
      format.html { redirect_to relcliclas_url, notice: 'Relclicla was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_relclicla
      @relclicla = Relclicla.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def relclicla_params
      params.require(:relclicla).permit(:IdCliente, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa)
    end
end
