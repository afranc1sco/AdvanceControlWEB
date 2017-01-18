class PregaladoController < ApplicationController
  before_action :authenticate_usuario!
  def index
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @clientes = Cliente.por_empresa(current_usuario.empresa_id)
    @productos = Producto.por_empresa(current_usuario.empresa_id)
  end

  def producto_obsequio
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @clientes = Cliente.por_empresa(current_usuario.empresa_id)
    @productos = Producto.por_empresa(current_usuario.empresa_id)
  end

  def busqueda
  #@pregalado = Pregalad.limit(10)
   @pregalado = Pregalad.busqueda_general(params)
   @detallevet = Detalleve.all
   @venta = Vent.all

    respond_to do |format|
    format.js
    end
  end

  def busqueda_producto_obsequio
  #@pregalado = Pregalad.limit(10)
   @pregalado = Pregalad.busqueda_general(params)
   @detallevet = Detalleve.all
   @venta = Vent.all

    respond_to do |format|
    format.js
    end
  end
end
