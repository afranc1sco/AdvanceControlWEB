class VentaController < ApplicationController
  before_action :authenticate_usuario!
  def venta
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @clientes = Cliente.por_empresa(current_usuario.empresa_id)
    @productos = Producto.por_empresa(current_usuario.empresa_id)
  end

  def busqueda_ventas
   @detallevet = Detalleve.all
    @ventas = Vent.busqueda_general(params)

    respond_to do |format|
    format.js
    end
  end


end
