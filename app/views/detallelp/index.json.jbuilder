json.array!(@detallelp) do |deta|
  json.extract! deta, :id, :listaid, :articulo, :preciomin, :preciomax, :idempresa
  json.url deta_url(deta, format: :json)
end
