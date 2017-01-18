class Detalleve < ActiveRecord::Base
  self.primary_key = 'ID'
  scope :por_ruta, -> (param) { where(RutaId: param) }
  scope :por_tipo, -> { where(TipoVta: "Contado") }

  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"



  def self.total_ventas_contado(params)
  query = select('detallevet.IVA, detallevet.Importe')
       .joins('left outer join venta ON venta.Documento=detallevet.Docto and venta.RutaId=detallevet.RutaId')
       .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.TipoVta = 'Contado') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
       .distinct
  query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
  query
   end

   def self.total_ventas_credito(params)
   query = select('detallevet.IVA, detallevet.Importe')
        .joins('left outer join venta ON venta.Documento=detallevet.Docto and venta.RutaId=detallevet.RutaId')
        .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.TipoVta = 'Credito') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
        .distinct
   query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
   query
    end

    def self.total_ventas_contadoCredito(params)
    query = select('detallevet.IVA, detallevet.Importe')
         .joins('left outer join venta ON venta.Documento=detallevet.Docto and venta.RutaId=detallevet.RutaId')
         .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.TipoVta = 'Contado' or venta.TipoVta = 'Credito') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
         .distinct
    query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
    query
     end




end
