class Detalle < ActiveRecord::Base
  self.primary_key = "id"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  #traeme todos los que tengan listaid igual al parametro
  scope :productosquetiene, -> (id_param) { where(ListaId: id_param) }


  belongs_to :productos, class_name:"Producto", foreign_key: "Articulo"

  before_save :valores_por_default

  def valores_por_default
    self.Factor ||= 0
  end
end
