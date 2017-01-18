class Vent < ActiveRecord::Base
  self.primary_key = 'Id'
  scope :por_ruta, -> (param) { where(RutaId: param) }
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "CodCliente"
  belongs_to :vendedores, class_name:"Vendedor", foreign_key: "VendedorId"

  has_many :detallevet, -> (vent) { where(Docto: vent.Documento, RutaId: vent.RutaId) },
           class_name: 'Detalleve'


  def self.busqueda_general(params)
  query = select('[venta].Id,[venta].RutaId,[venta].VendedorId,[venta].CodCliente,[venta].Documento,[venta].Fecha,[venta].TipoVta,[venta].DiasCred,[venta].CreditoDispo,[venta].Saldo,[venta].Fvence,[venta].SubTotal,[venta].IVA,[venta].IEPS,[venta].TOTAL,
            [venta].Cancelada, COUNT([detallevet].DescMon) AS venta_count,
              SUM(detallevet.Precio) AS sum_Precio,
              SUM(detallevet.DescMon) AS sum_DescMon,
              SUM(detallevet.Pza) AS sum_Pza')
       .joins('left outer join detallevet ON venta.Documento=detallevet.Docto and venta.RutaId=detallevet.RutaId')
       .group(:Id,:RutaId,:VendedorId,:CodCliente,:Documento,:Fecha,:TipoVta,:DiasCred,:CreditoDispo,:Saldo,:Fvence,:SubTotal,:IVA,:IEPS,:TOTAL,:Cancelada)
       .where("(venta.RutaId = :rutaId or :rutaId = '') AND (detallevet.Articulo = :articulo or :articulo = '')  AND (venta.CodCliente = :codcliente or :codcliente = '') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], articulo: params[:search3], codcliente: params[:search2], idempresa: params[:search6]})
       .distinct
  query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
   end


   def self.total_ventas_contado(params)
   query = select('SUM(detallevet.Importe+detallevet.IVA) AS suma_TOTAL')
        .joins('left outer join detallevet ON venta.Documento=detallevet.Docto and venta.RutaId=detallevet.RutaId')
        .group(:Id,:RutaId,:Documento,:Fecha,:TipoVta)
        .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.TipoVta = 'Contado') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
        .distinct
   query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
   query
    end








end
