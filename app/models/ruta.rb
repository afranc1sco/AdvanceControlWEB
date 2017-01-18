class Ruta < ActiveRecord::Base
  self.primary_key = "IdRutas"
  scope :primeros, ->{ order("IdRutas ASC").limit(20) }
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Activa: true) }
  scope :inactivos, -> { where(Activa: false) }
  scope :datos_ruta, ->(param_id) { find_by(IdRutas: param_id)} # para que no devuelva una coleccion, sino un solo registro
  scope :comprobar_existencia, ->(paramc) { where(Ruta: paramc)} # model



  # route model
  has_many :clientes, through: :relclirutas, source: :cliente, foreign_key: "IdCliente"



  has_many :relmens, class_name: "Relmen", foreign_key: "CodRuta"
  belongs_to :vendedor, class_name:"Vendedor", foreign_key: "Vendedor"

  has_one :configruta, class_name: "Configruta", foreign_key: "RutaId"
  accepts_nested_attributes_for :configruta

  has_one :continuid, class_name: "Continuid", foreign_key: "RutaID"
  accepts_nested_attributes_for :continuid

  has_one :relrucla, class_name: "Relrucla", foreign_key: "RutaId"
  accepts_nested_attributes_for :relrucla

  has_one :cobran, class_name: "Cobran", foreign_key: "RutaId"
  has_many :relclirutas, class_name: "Relcliruta", foreign_key: "IdRuta"

  #Reportes
  has_many :venta, class_name: "Venta", foreign_key: "RutaId"
  has_many :detallevet, class_name: "Detalleve", foreign_key: "RutaId"
  has_many :pregalado, class_name: "Pregalad", foreign_key: "RutaId"
  has_many :bitacoratiempos, class_name: "Bitacoratiempo", foreign_key: "RutaId"
  has_one :noventasingular, class_name: "Noventasingular", foreign_key: "RutaId"
  has_many :recarga, class_name: "Recarg", foreign_key: "IdRuta"



    def self.to_csv(options = {})#exportar
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |ruta|
          csv << ruta.attributes.values_at(*column_names)
        end
      end
    end

    def self.import(file)#importar
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        ruta = find_by_IdRutas(row["IdRutas"]) || new
        ruta.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
        ruta.save!
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
