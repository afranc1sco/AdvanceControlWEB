class Detalleprom < ActiveRecord::Base
  self.primary_key = 'Id'
  scope :productosbase_count, -> (id_param) { where(PromoId: id_param, Tipo: 0) }
  scope :productosRegalo_count1, -> (id_param) { where(PromoId: id_param) }
  scope :productosRegalo_count2, -> { where('Tipo = 1') }
  scope :por_nivel, ->{ order("Cantidad ASC") } #permite ordenar los articulos de manera descendiende, los ultimos q se crearon
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :listaprom, class_name:"Listaprom", foreign_key: "PromoId"
  belongs_to :producto, class_name: "Producto", foreign_key: "Articulo"

end
