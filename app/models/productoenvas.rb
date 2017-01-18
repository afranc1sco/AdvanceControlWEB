class Productoenvas < ActiveRecord::Base
  self.primary_key = "Id"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :productosquetiene, -> (id_param) { where(Producto: id_param) }

  belongs_to :producto, class_name:"Producto", foreign_key: "Producto"

end
