json.array!(@relcliclas) do |relclicla|
  json.extract! relclicla, :id, :IdCliente, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa
  json.url relclicla_url(relclicla, format: :json)
end
