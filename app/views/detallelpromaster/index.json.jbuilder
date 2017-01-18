json.array!(@detallelpromaster) do |detallelpromast|
  json.extract! detallelpromast, :id, :IdLm, :IdPromo, :IdEmpresa
  json.url detallelpromast_url(detallelpromast, format: :json)
end
