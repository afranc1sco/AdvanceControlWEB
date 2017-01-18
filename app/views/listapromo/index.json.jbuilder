json.array!(@listapromo) do |listaprom|
  json.extract! listaprom, :id, :Lista, :Descripcion, :Caduca, :FechaI, :FechaF, :Grupo, :Activa, :Tipo, :IdEmpresa
  json.url listaprom_url(listaprom, format: :json)
end
