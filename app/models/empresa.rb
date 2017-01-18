class Empresa < ActiveRecord::Base
  self.primary_key = 'IdEmpresa'
  has_many :usuarios
  belongs_to :empresamadre

  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(IdEmpresa: paramc)} # model

  scope :de_empresamadre, -> (id_param) { where(empresamadre_id: id_param) }

  scope :sucursales, -> (user_id) { where(empresamadre_id: user_id) }

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |empresa|
        csv << empresa.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)#importar
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      empresa = find_by_IdEmpresa(row["IdEmpresa"]) || new
      empresa.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
      empresa.save!
    end
  end

  def self.open_spreadsheet(file)#importar
    case File.extname(file.original_filename)
     when '.csv' then Roo::Csv.new(file.path, packed: false, file_warning: :ignore)
     #when '.xls' then Roo::Excel.new(file.path, packed: false, file_warning: :ignore)
     when '.xlsx' then Roo::Excelx.new(file.path, packed: false, file_warning: :ignore)
     #else raise "Unknown file type: #{file.original_filename}"
     else raise "El formato debe ser .xlsx ó .csv"


     end
  end


end
