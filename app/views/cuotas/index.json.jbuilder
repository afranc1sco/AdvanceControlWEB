json.array!(@cuotas) do |cuota|
  json.extract! cuota, :id, :Clave, :Descripcion, :UniMed, :Cantidad, :FechaI, :FechaF, :Producto, :Tipo, :Activa, :NivelNum, :IdEmpresa
  json.url cuota_url(cuota, format: :json)
end
