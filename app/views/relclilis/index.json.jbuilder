json.array!(@relclilis) do |relclili|
  json.extract! relclili, :id, :codcliente, :listap, :listad, :listapromo, :idempresa
  json.url relclili_url(relclili, format: :json)
end
