json.array!(@mvomerma) do |mvmerma|
  json.extract! mvmerma, :id, :merma, :clave, :status
  json.url mvmerma_url(mvmerma, format: :json)
end
