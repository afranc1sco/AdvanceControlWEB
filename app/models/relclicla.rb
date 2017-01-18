class Relclicla < ActiveRecord::Base
  self.primary_key = "IdRcC"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :cliente, class_name:"Cliente", foreign_key: "IdCliente"

  belongs_to :clascliente, class_name:"Clascliente", foreign_key: "Clas1"


end
