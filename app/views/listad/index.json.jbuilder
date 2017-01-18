json.array!(@listad) do |slista|
  json.extract! slista, :id, :lista, :tipo, :caduca, :fechaini, :fechafin, :idempresa
  json.url slista_url(slista, format: :json)
end
