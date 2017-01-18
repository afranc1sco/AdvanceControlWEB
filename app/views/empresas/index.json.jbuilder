json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :empresa
  json.url empresa_url(empresa, format: :json)
end
