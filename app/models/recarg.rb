class Recarg < ActiveRecord::Base
  self.primary_key = "ID"
  belongs_to :producto, class_name:"Producto", foreign_key: "Articulo"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "IdRuta"

  def self.busqueda_general(params)
  query = select('[recarga].ID,[recarga].Hora,[recarga].IdRuta,[recarga].Articulo,[recarga].Fecha,[recarga].Hora,[recarga].Cantidad,[productosxpzas].PzaXCja, ISNULL(recarga.Cantidad / productosxpzas.PzaXCja, 0) as Cajas ')
       .joins('INNER JOIN productos ON recarga.Articulo=productos.Clave LEFT OUTER JOIN productosxpzas ON Productos.Clave = productosxpzas.Producto')
       .group(:ID,:IdRuta,:Articulo,:Fecha,:Hora,:Cantidad,:Hora,:PzaXCja)
       .where("(recarga.IdRuta = :rutaId or :rutaId = '') AND (recarga.IdEmpresa = :idempresa) AND (recarga.Cantidad > 0) AND (productos.Ban_Envase = 0)",{rutaId: params[:search],idempresa: params[:search6]})
       .distinct
  query = query.where('recarga.Fecha >= ? AND recarga.Fecha <= ?', (params[:search4].to_date).strftime('%Y-%m-%d'), (params[:search5].to_date).strftime('%Y-%m-%d')) if params[:search4].present? and params[:search5].present?
  query
   end


end
