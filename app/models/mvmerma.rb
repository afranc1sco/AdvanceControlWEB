class Mvmerma < ActiveRecord::Base
  self.primary_key = "Id"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |mvmerma|
        csv << mvmerma.attributes.values_at(*column_names)
      end
    end
  end

end
