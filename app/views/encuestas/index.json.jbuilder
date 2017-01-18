json.array!(@encuestas) do |encuesta|
  json.extract! encuesta, :id, :Clave_Enc, :Desc_Enc, :Tipo_Enc, :IdEmpresa
  json.url encuesta_url(encuesta, format: :json)
end
