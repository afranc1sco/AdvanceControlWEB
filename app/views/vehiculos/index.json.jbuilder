json.array!(@vehiculos) do |vehiculo|
  json.extract! vehiculo, :id, :clave, :modelo, :placas, :marcas, :descripcion, :status, :numeroeco, :asignado, :poliza, :telseguro, :mesverifica, :kilometraje, :kilometrajesem, :aseguradora, :fechavencseguro, :fechaultverif
  json.url vehiculo_url(vehiculo, format: :json)
end
