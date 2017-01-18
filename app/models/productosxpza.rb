class Productosxpza < ActiveRecord::Base
  self.primary_key = "IDP"

  belongs_to :producto, class_name:"Producto", foreign_key: "Producto"



end
