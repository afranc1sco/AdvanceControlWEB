json.array!(@vendedores) do |vendedor|
  json.extract! vendedor, :idvendedor, :nombre, :status, :direccion, :telefono, :pdapw, :numlicencia, :metadiaria, :metames, :movil, :vencelic, :clave
  json.url vendedor_url(vendedor, format: :json)
end
