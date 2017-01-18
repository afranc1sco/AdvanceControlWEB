class Catmarca < ActiveRecord::Base
  self.primary_key = "IdMarca"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :producto_marca, -> { where(TipoMarca: "P") }
  scope :vehiculo_marca, -> { where(TipoMarca: "V") }
  scope :activos, -> { where(Status: true) }
end
