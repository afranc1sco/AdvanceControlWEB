json.array!(@relproclas) do |relprocla|
  json.extract! relprocla, :id, :ProductoId, :ClasiF, :Nivel, :Dep_Clasif, :Dep_Nivel, :IdEmpresa
  json.url relprocla_url(relprocla, format: :json)
end
