json.array!(@relruclas) do |relrucla|
  json.extract! relrucla, :id, :RutaId, :Clas1, :Clas2, :Clas3, :Clas4, :Clas5, :IdEmpresa
  json.url relrucla_url(relrucla, format: :json)
end
