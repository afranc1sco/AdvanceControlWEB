json.array!(@clasproductos) do |clasproducto|
  json.extract! clasproducto, :id, :Descripcion, :NivelNum, :IdEmpresa
  json.url clasproducto_url(clasproducto, format: :json)
end
