class Perfil < ActiveRecord::Base
  self.primary_key = "IdPerfiles"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
end
