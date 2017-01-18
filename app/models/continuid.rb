class Continuid < ActiveRecord::Base
  self.primary_key = "RutaID"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaID"
end
