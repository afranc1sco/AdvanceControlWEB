json.array!(@mvodev) do |mvodevolucion|
  json.extract! mvodevolucion, :id, :MvoDev, :Clave, :Status
  json.url mvodevolucion_url(mvodevolucion, format: :json)
end
