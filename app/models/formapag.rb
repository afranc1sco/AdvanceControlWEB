class Formapag < ActiveRecord::Base
  self.primary_key = 'IdFpag'
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model
  has_many :detalleco, class_name: "Detalleco", foreign_key: "FormaP"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |formapag|
        csv << formapag.attributes.values_at(*column_names)
      end
    end
  end

end
