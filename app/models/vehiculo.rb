class Vehiculo < ActiveRecord::Base
  self.primary_key = 'IdVehiculos'
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: "1") }
  scope :inactivos, -> { where(Status: "0") }
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model
  scope :ordered, -> { order(Placas: :asc) }

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |vehiculo|
        csv << vehiculo.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vehiculo = find_by_IdVehiculos(row["IdVehiculos"]) || new
      vehiculo.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
      vehiculo.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
     when '.csv' then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
     #when '.xls' then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
     when '.xlsx' then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
     #else raise "Unknown file type: #{file.original_filename}"
     else raise "El formato debe ser .xlsx ó .csv"


     end
  end

end
