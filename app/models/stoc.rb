class Stoc < ActiveRecord::Base
  self.primary_key = "IdStock"
  scope :por_ruta, -> (id_param) { where(Ruta: id_param) }

  belongs_to :producto, class_name:"Producto", foreign_key: "Articulo"

end
