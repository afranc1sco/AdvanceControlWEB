json.array!(@relmens) do |relmen|
  json.extract! relmen, :id, :MenId, :CodCliente, :IdCliente, :CodProducto, :IdProducto, :CodRuta, :IdRuta, :IdEmpresa
  json.url relmen_url(relmen, format: :json)
end
