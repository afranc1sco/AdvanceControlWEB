json.array!(@ayudantes) do |ayudante|
  json.extract! ayudante, :id, :nombre, :direccion, :telefono, :status, :numlicencia, :vencelic, :clave
  json.url ayudante_url(ayudante, format: :json)
end
