class Comision < ActiveRecord::Base
  self.primary_key = "ID_Comision"
  scope :activos, -> { where(Status: "A") }
  scope :inactivos, -> { where(Status: "I") }

  belongs_to :producto, class_name:"Comision"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |comision|
        csv << comision.attributes.values_at(*column_names)
      end
    end
  end

end
