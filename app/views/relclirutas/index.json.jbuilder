json.array!(@relclirutas) do |relcliruta|
  json.extract! relcliruta, :id, :IdCliente, :IdRuta, :IdEmpresa
  json.url relcliruta_url(relcliruta, format: :json)
end
