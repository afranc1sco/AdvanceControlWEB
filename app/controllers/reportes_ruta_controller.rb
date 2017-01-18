class ReportesRutaController < ApplicationController
  def recargas
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  def envases
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @diao = Diaop.where("RutaId = ? AND IdEmpresa = ?", @rutas.first.IdRutas, current_usuario.empresa_id)
  end
  def consumos
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
    @diao = Diaop.where("RutaId = ? AND IdEmpresa = ?", @rutas.first.IdRutas, current_usuario.empresa_id)
  end

  def update_dia
    @diao = Diaop.where("RutaId = ?", params[:search])
    respond_to do |format|
      format.js
    end
  end

  def busqueda_recarga
   @recarga = Recarg.busqueda_general(params)

    respond_to do |format|
    format.js
    end
  end

  def busqueda_envase
   @envases = Devenvase.busqueda_general(params)

    respond_to do |format|
    format.js
    end
  end

  def busqueda_consumo
   @consumo = Medidor.dia(params).ruta(params)

    respond_to do |format|
    format.js
    end
  end

end
