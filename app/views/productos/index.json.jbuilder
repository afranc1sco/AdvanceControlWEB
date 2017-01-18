json.array!(@productos) do |producto|
  json.extract! producto, :id, :clave, :producto, :codbarras, :granel, :iva, :ieps, :unimed, :vbase, :equivalente, :sector, :ban_envase, :idclasp, :idempresa, :status
  json.url producto_url(producto, format: :json)
end
