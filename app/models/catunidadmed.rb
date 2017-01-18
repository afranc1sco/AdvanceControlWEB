class Catunidadmed < ActiveRecord::Base
  self.primary_key = "IdUnidad"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: true) }
  has_many :productos, class_name: "Producto", foreign_key: "UniMed"
end
