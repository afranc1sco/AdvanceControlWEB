class Catbanco < ActiveRecord::Base
  self.primary_key = "IdBanco"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
end
