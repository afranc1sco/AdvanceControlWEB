class Configruta < ActiveRecord::Base
  self.primary_key = "Id"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"

end
