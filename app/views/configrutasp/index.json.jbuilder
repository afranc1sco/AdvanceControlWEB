json.array!(@configrutasp) do |configruta|
  json.extract! configruta, :id, :RutaId, :ModelPrinter, :VelCom, :COM, :Server, :Puerto, :ServerGPS, :GPS, :PuertoG, :PagoContado, :CteNvo, :CveCteNvo, :IdEmpresa, :SugerirCant, :PromoEq
  json.url configruta_url(configruta, format: :json)
end
