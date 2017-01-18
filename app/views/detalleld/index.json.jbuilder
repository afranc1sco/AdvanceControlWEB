json.array!(@detalleld) do |detalle|
  json.extract! detalle, :id, :listaid, :articulo, :tipo, :idempresa
  json.url detalle_url(detalle, format: :json)
end
