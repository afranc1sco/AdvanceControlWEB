json.array!(@listapromomaster) do |listapromomast|
  json.extract! listapromomast, :id, :Id, :ListaMaster, :Promociones, :IdEmpresa
  json.url listapromomast_url(listapromomast, format: :json)
end
