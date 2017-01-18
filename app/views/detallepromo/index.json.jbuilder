json.array!(@detallepromo) do |detalleprom|
  json.extract! detalleprom, :id, :Articulo, :PromoId, :Cantidad, :Tipo, :TipoProm, :Monto, :Volumen, :TipMed, :IdEmpresa, :Nivel
  json.url detalleprom_url(detalleprom, format: :json)
end
