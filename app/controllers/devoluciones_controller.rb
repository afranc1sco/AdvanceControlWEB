class DevolucionesController < ApplicationController
  before_action :authenticate_usuario!
  def index
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @clientes = Cliente.por_empresa(current_usuario.empresa_id)
    @productos = Producto.por_empresa(current_usuario.empresa_id)
    end

  def busqueda_devoluciones
   @devoluciones = Devolucion.busqueda_general(params)
   @detalledevol = Detalledevo.all

    respond_to do |format|
    format.js
    end
  end
end
