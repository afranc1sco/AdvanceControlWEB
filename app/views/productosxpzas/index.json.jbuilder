json.array!(@productosxpzas) do |productosxpza|
  json.extract! productosxpza, :id, :producto, :pzaxcja, :idempresa
  json.url productosxpza_url(productosxpza, format: :json)
end
