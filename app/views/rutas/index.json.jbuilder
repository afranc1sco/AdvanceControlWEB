json.array!(@rutas) do |ruta|
  json.extract! ruta, :id, :Ruta, :Activa, :TipoRuta, :VenSinStock, :Oficina, :Sector, :Vendedor, :Tipo, :id_ayudante1, :id_ayudante2, :VendedorAyudante, :Foranea, :vehiculo, :idcrutas, :IdEmpresa
  json.url ruta_url(ruta, format: :json)
end
