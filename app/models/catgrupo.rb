class Catgrupo < ActiveRecord::Base
  self.primary_key = "Clave"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :producto_sector, -> { where(TipoGrupo: "P") }
  scope :ruta_grupo, -> { where(TipoGrupo: "R") }
  scope :ruta_tipo, -> { where(TipoGrupo: "T") }
  scope :activos, -> { where(Status: true) }

  has_many :productos, class_name: "Producto", foreign_key: "Sector"
end
