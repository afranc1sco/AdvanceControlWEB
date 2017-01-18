class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  # GET /usuarios
  # GET /usuarios.json
  def index
    @usuarios = Usuario.por_empresa(current_usuario.empresa_id)
    @usuario = Usuario.new
    respond_to do |format|
      format.html
      format.csv { send_data @usuarios.to_csv}
      format.xls #{ send_data @empresas.to_csv(col_sep: "\t") }
    end
  end

  def usuario_sucursales
    @usuario = Usuario.datos(current_usuario.IdUsuario)
    @sucursales = Empresa.sucursales(current_usuario.empresamadre_id)
    @empresa = Empresamadre.datos(current_usuario.empresamadre_id)
  end

  def usuarios_check
    @usuariox = Usuario.comprobar_existencia(params[:usuario][:usuario]).first
    respond_to do |format|
    format.json { render :json => !@usuariox }
    end
  end

  def usuarios_check2
    @usuario_Ex = Usuario.comprobar_existencia_Email(params[:usuario][:email]).first
    respond_to do |format|
    format.json { render :json => !@usuario_Ex }
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @usuario }
        format.js {flash.now[:notice] = 'El usuario se ha creado de forma exitosa.'} #ajax
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el usuario.'} #ajax
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to root_path}
        format.json { render :show, status: :ok, location: @usuario }
        format.js {flash.now[:notice] = 'El usuario se ha actualizado de forma exitosa.'} #ajax

      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el usuario.'} #ajax
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
      format.js {flash.now[:notice] = 'El usuario se ha borrado de forma exitosa.'} #ajax
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:email, :usuario, :password, :password_confirmation, :Nombre, :empresa_id, :empresamadre_id)
    end

end
