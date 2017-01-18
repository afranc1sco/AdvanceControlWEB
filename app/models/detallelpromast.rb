class Detallelpromast < ActiveRecord::Base
  self.primary_key = "Id"
  scope :promocionesquetiene, -> (id_param) { where(IdLm: id_param) }
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :listaprom, class_name:"Listaprom", foreign_key: "IdPromo"
  belongs_to :listapromomast, class_name:"Listapromomast", foreign_key: "IdLm"


end
