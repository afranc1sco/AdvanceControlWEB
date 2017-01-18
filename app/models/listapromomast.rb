class Listapromomast < ActiveRecord::Base
  self.primary_key = 'Id'
  has_one :detallelpromast, class_name: "Detallelpromast", foreign_key: "IdLm"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :nombre_grupo, ->(param_id) { find_by(Id: param_id)} # para que no devuelva una coleccion, sino un solo registro

  has_many :relclilis, class_name: "Relclili", foreign_key: "ListaPromo"
  has_many :clientes, through: :relclilis, source: :cliente, foreign_key: "CodCliente"

end
