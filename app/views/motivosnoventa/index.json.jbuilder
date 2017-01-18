json.array!(@motivosnoventa) do |motivonoventa|
  json.extract! motivonoventa, :id, :motivo, :clave, :status
  json.url motivonoventa_url(motivonoventa, format: :json)
end
