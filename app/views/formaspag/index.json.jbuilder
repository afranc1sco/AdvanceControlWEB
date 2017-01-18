json.array!(@formaspag) do |formapag|
  json.extract! formapag, :id, :forma, :clave, :status
  json.url formapag_url(formapag, format: :json)
end
