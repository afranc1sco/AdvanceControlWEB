class Clascliente < ActiveRecord::Base
  self.primary_key = "IdClasC"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  scope :clas1_scope, -> {where(NivelNum: 1 )}
  scope :clas2_scope, -> {where(NivelNum: 2 )}
  scope :clas3_scope, -> {where(NivelNum: 3 )}
  scope :clas4_scope, -> {where(NivelNum: 4 )}
  scope :clas5_scope, -> {where(NivelNum: 5 )}

  has_many :relcliclas, class_name: "Relclicla", foreign_key: "Clas1"

end
