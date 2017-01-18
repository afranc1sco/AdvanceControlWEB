class Listaprom < ActiveRecord::Base
  scope :activos, -> { where(Activa: true) }
  scope :inactivos, -> { where(Activa: false) }
  scope :comprobar_existencia, ->(paramc) { where(Lista: paramc)} # model

  has_many :detallepromo, -> { order 'Nivel asc' }, class_name: "Detalleprom", foreign_key: "PromoId"
  has_one :detallelpromast, class_name: "Detallelpromast", foreign_key: "IdPromo"
  has_many :relclilis, class_name: "Relclili", foreign_key: "ListaPromo"

  accepts_nested_attributes_for :detallepromo, reject_if: proc { |attributes| attributes['Cantidad'].blank?}, allow_destroy: true

  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model


end
