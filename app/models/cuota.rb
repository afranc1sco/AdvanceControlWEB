class Cuota < ActiveRecord::Base
  self.primary_key = "Id"
  validates :Clave, presence: true, uniqueness: true #presence true validara que el elemento no se pueda guardar vacio y uniquenes para que no se repita en la base de datos
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |cuota|
        csv << cuota.attributes.values_at(*column_names)
      end
    end
  end

end
