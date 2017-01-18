class Tdcomision < ActiveRecord::Base
  self.primary_key = 'ID_Detalle'
  auto_increment :ID_Detalle
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  #traeme todos los que tengan listaid igual al parametro
  scope :detalles_de_la_comision, -> (id_param) { where(ID_Comision: id_param) }


end
