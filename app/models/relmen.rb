class Relmen < ActiveRecord::Base
  self.primary_key = "IDRow"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :productos, class_name:"Producto", foreign_key: "CodProducto"
  belongs_to :clientes, class_name:"Cliente", foreign_key: "CodCliente"
  belongs_to :rutas, class_name:"Ruta", foreign_key: "CodRuta"

  scope :productosquetiene, -> (id_param) { where(IdProducto: id_param) }
  scope :clientesquetiene, -> (id_param) { where(IdCliente: id_param) }
  scope :rutasquetiene, -> (id_param) { where(IdRuta: id_param) }

end
