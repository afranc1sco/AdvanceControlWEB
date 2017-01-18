class Relactivo < ActiveRecord::Base
  self.primary_key = "IdRow"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: "Disponible") }
  scope :inactivos, -> { where(Status: "No disponible") }

  belongs_to :cliente, class_name:"Cliente", foreign_key: "Cliente"

  belongs_to :activo, class_name:"Activo", foreign_key: "Activo"

  scope :activos_del_cliente, -> (id_param) { where(Cliente: id_param) }

end
