class Diaop < ActiveRecord::Base
  self.primary_key = "Id"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
end
