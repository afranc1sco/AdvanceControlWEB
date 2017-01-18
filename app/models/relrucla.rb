class Relrucla < ActiveRecord::Base
  self.primary_key = "IdRelRClas"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  before_save :valores_por_default

  belongs_to :ruta, class_name:"Ruta", foreign_key: "RutaId"

  def valores_por_default
  	self.Clas1 ||= 0
    self.Clas2 ||= 0
    self.Clas3 ||= 0
    self.Clas4 ||= 0
    self.Clas5 ||= 0
  end

end
