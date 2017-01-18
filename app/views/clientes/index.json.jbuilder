json.array!(@clientes) do |cliente|
  json.extract! cliente, :id, :nombre, :nombrecorto, :direccion, :referencia, :telefono, :cp, :credito, :limitecredito, :status, :diascreedito, :colonia, :tel2, :email, :visitaobligada, :firmaobligada, :motivobajaid, :saldo, :horario, :idclasc, :idempresa
  json.url cliente_url(cliente, format: :json)
end
