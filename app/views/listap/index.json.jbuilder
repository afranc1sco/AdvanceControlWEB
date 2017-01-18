json.array!(@listap) do |list|
  json.extract! list, :id, :lista, :tipo, :fechaini, :fechafin, :idempresa
  json.url list_url(list, format: :json)
end
