json.array!(@clasclientes) do |clascliente|
  json.extract! clascliente, :id, :IdClasC, :Descripcion, :NivelNum
  json.url clascliente_url(clascliente, format: :json)
end
