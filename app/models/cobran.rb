class Cobran < ActiveRecord::Base
  scope :por_ruta, -> (id_param) { where(RutaId: id_param) }
  scope :aquellos_con_saldo_pendiente, -> { where(Status: "1") }
  scope :aquellos_con_pagos, -> { where(Status: "1") }



  belongs_to :cliente, class_name:"Cliente", foreign_key: "Cliente"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"
  has_many :detallecob, class_name: "Detalleco", foreign_key: "IdCobranza"


  def self.busqueda_cobranza(params)
   query =   joins("left outer join detallecob on cobranza.id=detallecob.IdCobranza")
                      .where("detallecob.IdCobranza IS NOT NULL AND (cobranza.RutaId = :rutaId or :rutaId = '') AND (cobranza.Cliente = :codcliente or :codcliente = '') AND (cobranza.IdEmpresa = :idempresa)",{rutaId: params[:search], codcliente: params[:search2], idempresa: params[:search6]})
                      .distinct
  query = query.where('detallecob.Fecha >= ? AND detallecob.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
  end

end
