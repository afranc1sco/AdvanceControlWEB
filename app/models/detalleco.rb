class Detalleco < ActiveRecord::Base
  self.primary_key = "Id"
  scope :por_ruta, -> (id_param) { where(Ruta: id_param) }
  belongs_to :cobran, class_name:"Cobran", foreign_key: "IdCobranza"
  belongs_to :formapag, class_name:"Formapag", foreign_key: "FormaP"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "Cliente"






end
