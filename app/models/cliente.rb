class Cliente < ActiveRecord::Base
  self.primary_key = "IdCli"
  scope :primeros, ->{ order("IdCli ASC").limit(20) }
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :comprobar_existencia, ->(paramc) { where(IdCli: paramc)} # model
  scope :clp, -> { where(IdCli: "10601942")} # model

  scope :datos_cliente, ->(param_id) { find_by(IdCli: param_id)} # para que no devuelva una coleccion, sino un solo registro


  has_one :listapromomast, through: :relclili, source: :listapromomast, foreign_key: "ListaPromo"


    # client model
    has_many :rutas, through: :relclirutas, source: :ruta, foreign_key: "IdRuta"




  has_one :relclili, class_name: "Relclili", foreign_key: "CodCliente"
  has_many :relclirutas, class_name: "Relcliruta", foreign_key: "IdCliente"

  has_many :relactivos, class_name: "Relactivo", foreign_key: "Cliente"

  has_many :relmens, class_name: "Relmen", foreign_key: "CodCliente"

  has_one :reldayc, class_name: "Reldayc", foreign_key: "CodCli"

  has_one :relclicla, class_name: "Relclicla", foreign_key: "IdCliente"
  accepts_nested_attributes_for :relclicla

  has_one :cobran, class_name: "Cobran", foreign_key: "Cliente"
  has_many :detallecob, class_name: "Detalleco", foreign_key: "Cliente"

  #Reportes
  has_many :venta, class_name:"Vent", foreign_key: "CodCliente"
  has_many :devoluciones, class_name:"Devol", foreign_key: "CodCliente"
  has_many :pregalado, class_name:"Pregalad", foreign_key: "Cliente"
  has_many :bitacoratiempos, class_name:"Bitacoratiempo", foreign_key: "Codigo"
  has_one :noventasingular, class_name: "Noventasingular", foreign_key: "Cliente"



  def self.busqueda_general
   query = select("clientes.IdCli,clientes.Nombre,clientes.NombreCorto,clientes.Direccion,clientes.Colonia,clientes.Email,
   clientes.Credito,clientes.DiasCreedito,clientes.LimiteCredito,clientes.Saldo, listapromomaster.ListaMaster as promocion")
   .joins('LEFT JOIN relclilis On clientes.IdCli=relclilis.CodCliente LEFT JOIN listapromomaster On relclilis.ListaPromo=listapromomaster.Id')
   .group(:IdCli,:Nombre,:NombreCorto,:Direccion,:Colonia,:Email,:Credito,:DiasCreedito,:LimiteCredito,:Saldo,:ListaMaster)

  end

    def self.to_csv(options = {})#exportar
      CSV.generate(options) do |csv|
        csv << column_names
        all.each do |cliente|
          csv << cliente.attributes.values_at(*column_names)
        end
      end
    end

    def self.import(file)#importar
      spreadsheet = open_spreadsheet(file)
      header = spreadsheet.row(1)
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        cliente = find_by_IdCli(row["IdCli"]) || new
        cliente.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
        cliente.save!
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
