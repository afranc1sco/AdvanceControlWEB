class Pregalad < ActiveRecord::Base
  self.primary_key = "Id"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "Cliente"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"
  belongs_to :producto, class_name:"Producto", foreign_key: "SKU"

  def self.busqueda_general(params)
   query =   select("pregalado.*, venta.Fecha AS fecha_venta")
              .joins("left outer join venta on pregalado.Docto=venta.Documento and pregalado.RutaId=venta.RutaId")
                      .where("(pregalado.RutaId = :rutaId or :rutaId = '') AND (pregalado.SKU = :articulo or :articulo = '')  AND (pregalado.Cliente = :codcliente or :codcliente = '') AND (pregalado.IdEmpresa = :idempresa)",{rutaId: params[:search], articulo: params[:search3], codcliente: params[:search2], idempresa: params[:search6]})
                      .distinct
  query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
  end

  def self.busqueda_producto_obsequio(params)
   query =   select("pregalado.*, venta.Fecha AS fecha_venta")
              .joins("left outer join venta on pregalado.Docto=venta.Documento and pregalado.RutaId=venta.RutaId")
                      .where("(pregalado.RutaId = :rutaId or :rutaId = '') AND (pregalado.SKU = :articulo or :articulo = '')  AND (pregalado.Cliente = :codcliente or :codcliente = '') AND (pregalado.IdEmpresa = :idempresa)",{rutaId: params[:search], articulo: params[:search3], codcliente: params[:search2], idempresa: params[:search6]})
                      .distinct
  query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
  end







end
