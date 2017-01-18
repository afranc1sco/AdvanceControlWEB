json.array!(@mensajes) do |mensaje|
  json.extract! mensaje, :id, :Clave, :EnBaseA, :Descripcion, :Mensaje, :FechaInicio, :FechaFinal, :Estado, :IdEmpresa
  json.url mensaje_url(mensaje, format: :json)
end
