class Codigopostal < ActiveRecord::Base
  self.primary_key = "CP"
  scope :search, ->(paramc) { where(CP: paramc)} # model
end
