class Motivonoventa < ActiveRecord::Base
  self.primary_key = "IdMot"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model

  has_one :noventasingular, class_name: "Noventasingular", foreign_key: "MotivoId"

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |motivonoventa|
        csv << motivonoventa.attributes.values_at(*column_names)
      end
    end
  end
end
