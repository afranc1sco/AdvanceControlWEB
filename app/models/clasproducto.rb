class Clasproducto < ActiveRecord::Base
  self.primary_key = "IdClasP"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
end
