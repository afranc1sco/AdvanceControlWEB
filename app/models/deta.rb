class Deta < ActiveRecord::Base
  belongs_to :productos, class_name:"Producto", foreign_key: "Articulo"
  scope :productosquetiene, -> (id_param) { where(ListaId: id_param) }
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :listap, class_name:"List", foreign_key: "ListaId"

end
