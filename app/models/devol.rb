class Devol < ActiveRecord::Base
  self.primary_key = "Id"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "CodCliente"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  def self.busqueda_general(params)
   query = select('[devoluciones].Id,[devoluciones].CodCliente,[devoluciones].Devol,[devoluciones].Fecha,[devoluciones].Status,[devoluciones].Ruta,[devoluciones].Vendedor,[devoluciones].Items,[devoluciones].Docto,[devoluciones].Cancelada,
   [devoluciones].IdEmpresa,[devoluciones].Subtotal,[devoluciones].Total,[devoluciones].IVA, COUNT([detalledevol].Pza) AS detalles_count, SUM(detalledevol.Pza) AS sum_Pza')
              .joins("left outer join detalledevol on devoluciones.Docto=detalledevol.Docto and devoluciones.Ruta = detalledevol.RutaId")
              .group(:Id,:CodCliente,:Devol,:Fecha,:Status,:Ruta,:Vendedor,:Items,:KG,:Docto,:Cancelada, :IdEmpresa, :Subtotal, :Total, :IVA)
                      .where("(devoluciones.Ruta = :rutaId or :rutaId = '') AND (detalledevol.SKU = :articulo or :articulo = '')  AND (devoluciones.CodCliente = :codcliente or :codcliente = '')",{rutaId: params[:search], articulo: params[:search3], codcliente: params[:search2]})
                      .distinct
  query = query.where('devoluciones.Fecha >= ? AND devoluciones.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
  end

end
