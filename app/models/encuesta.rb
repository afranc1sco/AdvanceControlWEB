class Encuesta < ActiveRecord::Base
  self.primary_key = 'ID'
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |encuesta|
        csv << encuesta.attributes.values_at(*column_names)
      end
    end
  end

end
