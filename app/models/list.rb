class List < ActiveRecord::Base
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :comp_si_es_por_rango_de_precios, ->(lista_id) { where(id: lista_id).first } # para verificar si es lista de precio normal o por rango de precios. se debe colocar .first porque asi no devuelve una coleccion sino un solo objeto
  has_many :detallelp, class_name: "Deta", foreign_key: "ListaId"

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |list|
        csv << list.attributes.values_at(*column_names)
      end
    end
  end

end
