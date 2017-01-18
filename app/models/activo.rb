class Activo < ActiveRecord::Base
  self.primary_key = "IdActivos"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: "Disponible") }
  scope :inactivos, -> { where(Status: "No disponible") }
  scope :coprobar_existencia, ->(paramc) { where(CB: paramc)} # model

  has_one :relactivo, class_name: "Relactivo", foreign_key: "Activo"
  validates :CB,uniqueness: true

  scope :activos_sin_clientes, -> { joins('left outer join relactivos on activos.IdActivos=relactivos.Activo').select('activos.*,relactivos.Activo').where('relactivos.Activo is null') }
  #scope que busca aquellos registros que no esten asociados a relactivos

  has_attached_file :cover, styles: { thumb: "400x300", minithumb: "80x55" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/#validacion para evitar ataques, y solo esperar un tipo de archivo en content type, como pdf, ejecutables, imagenes etc. con el tipo de archivo especificado, el usuario puede subir varios tipos de imagenes

end
