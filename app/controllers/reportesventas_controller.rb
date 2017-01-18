class ReportesventasController < ApplicationController
  before_action :authenticate_usuario!
  def Visita_sin_venta
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @clientes = Cliente.por_empresa(current_usuario.empresa_id)
    @productos = Producto.por_empresa(current_usuario.empresa_id)
  end

  def busqueda_noventas
  #@pregalado = Pregalad.limit(10)
   @pregalado = Pregalad.busqueda_general(params).limit(10)
   @detallevet = Detalleve.all
   @noventas = Noventasingular.busqueda_general(params)

    respond_to do |format|
    format.js
    end
  end

end
