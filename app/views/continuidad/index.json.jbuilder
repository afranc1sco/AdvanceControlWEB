json.array!(@continuidad) do |continuid|
  json.extract! continuid, :id, :RutaID, :DiaO, :FolVta, :FolPed, :FolDevol, :FolCob, :UDiaO, :CteNvo, :IdEmpresa
  json.url continuid_url(continuid, format: :json)
end
