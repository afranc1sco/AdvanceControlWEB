json.array!(@clasrutas) do |clasruta|
  json.extract! clasruta, :id, :IdCRutas, :Descripcion, :NivelNum
  json.url clasruta_url(clasruta, format: :json)
end
