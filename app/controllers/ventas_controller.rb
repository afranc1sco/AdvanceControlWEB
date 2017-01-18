class VentasController < ApplicationController
  before_action :authenticate_usuario!
  def index
    @rutas = Ruta.por_empresa(current_usuario.empresa_id)
  end

  def index2
  end

  def index3
  end

  def index4


  end

  def busqueda_general_graficos
    @total_clientes = Bitacoratiempo.total_clientes(params).count
    @total_clientes_porcentaje = Relcliruta.total_clientes_Ruta(params).count
    #Sacar el promedio del tiempo
      # Get all values to find average
      values = Bitacoratiempo.prom_tiempo_visita(params).pluck(:TS)
      # Convert it to plain integers
      conv_values = values.map {|val| Time.parse(val).seconds_since_midnight }
      # Then count the average
      if conv_values.sum != 0
        avg = conv_values.sum / conv_values.length
      else
        avg = 0
      end
      # Optionally convert it to the string
      nice_string = Time.at(avg).utc.strftime("%H:%M")
      @prom_tiempo_visita = nice_string
    #fin del calculo del tiempo

    @total_ventas_contado = Detalleve.total_ventas_contado(params).sum("Importe+detallevet.IVA")
    @total_ventas_credito = Detalleve.total_ventas_credito(params).sum("Importe+detallevet.IVA")
    @total_ventas = Detalleve.total_ventas_contadoCredito(params).sum("Importe+detallevet.IVA")

    @best_seller = Producto.bestseller(params)
    @best_product = Producto.bestseller(params).first
      @contador = 6

    @worst_seller = Producto.worstseller(params)

    respond_to do |format|
    format.js
    end
  end

  def busqueda_clientes_captados
    @rutas = Ruta.joins('left outer join relclirutas on rutas.IdRutas=relclirutas.IdRuta')
                     .where('relclirutas.IdRuta IS NOT NULL AND relclirutas.IdEmpresa = ? AND (relclirutas.Fecha >= ? AND relclirutas.Fecha <= ?)',current_usuario.empresa_id, (params[:search].to_date).strftime('%Y-%m-%d'),( params[:search2].to_date).strftime('%Y-%m-%d'))
                     .distinct

    respond_to do |format|
    format.js
    end
  end



end
