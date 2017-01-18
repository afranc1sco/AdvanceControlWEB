class Vendedor < ActiveRecord::Base
  self.primary_key = 'IdVendedor'
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model

  scope :vendedores, -> { where(tipo: "Vendedor") }
  #scope :vendedores, -> { where("tipo = ? OR tipo IS NULL", 'Vendedor') } ya no es necesario debido a que actualice todos los registros nulos

  scope :ayudantes, -> { where(Tipo: "Ayudante") }
  has_one :ruta, class_name: "Ruta", foreign_key: "Vendedor"
  has_many :venta, class_name: "Vent", foreign_key: "VendedorId"

  scope :vendedores_sin_ruta, -> { joins('left outer join rutas on vendedores.IdVendedor=rutas.Vendedor').select('vendedores.*,rutas.Vendedor').where('rutas.Vendedor is null') }
  #scope que busca aquellos registros que no esten asociados a rutas

  scope :ordered, -> { order(Nombre: :asc) }

  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |vendedor|
        csv << vendedor.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)#importar
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      vendedor = find_by_Clave(row["Clave"]) || new
      vendedor.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
      vendedor.save!
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
