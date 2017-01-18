json.array!(@perfiles) do |perfil|
  json.extract! perfil, :id, :Altas, :Bajas, :Modi, :Listar, :Modulo, :IdUser, :Aceso, :Codigo, :usaPW, :Otro, :Descripcion
  json.url perfil_url(perfil, format: :json)
end
