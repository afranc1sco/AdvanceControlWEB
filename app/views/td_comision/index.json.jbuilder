json.array!(@td_comision) do |tdcomision|
  json.extract! tdcomision, :id, :ID_Comision, :RangoIni, :RangoFin, :Angente, :Ayudante, :Tipo, :IdEmpresa
  json.url tdcomision_url(tdcomision, format: :json)
end
