class Usuarios::SessionsController < Devise::SessionsController
# before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def busqueda_sucursales #Actualiza las sucursales concorde a las empresas en el acceso
    @sucursales = Empresa.where("empresamadre_id = ?", params[:empresa])
    respond_to do |format|
      format.js
    end
  end

  def new
    @empresas = Empresamadre.all
    @sucursales = Empresa.where("empresamadre_id = ?", @empresas.first.id)
    super
  end

  def create
    super
    if current_usuario.present? 
    current_usuario.update(empresa_id: params[:sucursal])
  end
  end

  def update
    super
  end

  private
  def sign_up_params
    allow = [:email, :usuario, :password, :password_confirmation, :nombre, :idempresa]
    params.require(resource_name).permit(allow)
  end
end
