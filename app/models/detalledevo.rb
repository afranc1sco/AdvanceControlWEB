class Detalledevo < ActiveRecord::Base
  self.primary_key = "Id"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"
  belongs_to :producto, class_name:"Producto", foreign_key: "SKU"
end
