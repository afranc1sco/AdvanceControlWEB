class Bitacoratiempo < ActiveRecord::Base
  self.primary_key = "Id"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "Codigo"


  def self.total_clientes(params)
   query =  joins("left outer join clientes on bitacoratiempos.Codigo=clientes.IdCli")
                      .where("(bitacoratiempos.RutaId = :rutaId or :rutaId = '') AND (bitacoratiempos.IdEmpresa = :idempresa) AND (bitacoratiempos.Visita = 1) ",{rutaId: params[:search], idempresa: params[:search0]})
                      .distinct
  query = query.where('bitacoratiempos.HI >= ? AND bitacoratiempos.HI <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
  query
  end

  #  SELECT DISTINCT COUNT(*) FROM BitacoraTiempos INNER JOIN Clientes ON BitacoraTiempos.Codigo = Clientes.IdCli
  #   WHERE(BitacoraTiempos.RutaId = 218) and BitacoraTiempos.HI between '20160402' and '20160410'


  def self.prom_tiempo_visita(params)
   query =  joins("left outer join clientes on bitacoratiempos.Codigo=clientes.IdCli")
                      .where("(bitacoratiempos.RutaId = :rutaId or :rutaId = '') AND (bitacoratiempos.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
                      .distinct
  query = query.where('bitacoratiempos.HI >= ? AND bitacoratiempos.HI <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
  query
  end







end
