json.array!(@productoenvase) do |productoenvas|
  json.extract! productoenvas, :id, :Producto, :Envase, :Cant_Base, :Cant_Eq, :Status, :IdEmpresa
  json.url productoenvas_url(productoenvas, format: :json)
end
