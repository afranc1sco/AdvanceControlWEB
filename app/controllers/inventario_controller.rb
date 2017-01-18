class InventarioController < ApplicationController
  before_action :authenticate_usuario!
  def producto_negado
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @diaso = Diaop.por_empresa(current_usuario.empresa_id)
  end

  def busqueda_producto_negado
    @producto_negado = Productoneg.busqueda_general(params)

    respond_to do |format|
    format.js
    end
  end

end
