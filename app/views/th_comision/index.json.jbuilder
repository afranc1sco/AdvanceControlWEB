json.array!(@th_comision) do |comision|
  json.extract! comision, :id, :status, :comentarios, :idempresa, :id_producto
  json.url comision_url(comision, format: :json)
end
