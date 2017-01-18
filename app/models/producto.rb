class Producto < ActiveRecord::Base
  self.primary_key = "Clave"
  scope :por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model
#  scope :productosquetiene, -> (id_param) { where(ListaId: id_param) }
  scope :envases, -> { where(Ban_Envase: true) }
  scope :activos, -> { where(Status: "A") }
  scope :inactivos, -> { where(Status: "I") }
  scope :datos_producto, ->(param_id) { find_by(Clave: param_id)} # para que no devuelva una coleccion, sino un solo registro
  scope :comprobar_existencia, ->(paramc) { where(Clave: paramc)} # model

#scope productos promociones
  scope :promociones_productos_por_empresa, ->(user_id) { where(IdEmpresa: user_id) } # model

  #scope :without_discount -> {Product.includes(:detalleId).where(:detalleId => { id: nil })}
  #scope :without_discount, -> (id_param) {Producto.includes(:detalleld).where("detalleld.ListaId <> ?", id_param)}
# scope :without_discount, -> (id_params) {Producto.includes(:detalleld).where.not(:detalleld => { listaid: id_params })}
#scope :without_discount, -> {Producto.includes(:detalleld).references(:detalleld).where("detalleld.id IS NULL")}

#buscame aquellos productos que no tengan un detalleld o detalle.listaid sea diferente del q paso x el url
  scope :without_discount, -> (id_params) {Producto.includes(:detalleld).references(:detalleld).where("detalleld.id IS NULL OR detalleld.listaid <> ?", id_params)}

  scope :wut, -> {Producto.includes(:detalleld).where(:detalleld => { id: nil })}

  has_one :productosxpza, class_name: "Productosxpza", foreign_key: "Producto"
  accepts_nested_attributes_for :productosxpza

  has_one :stoc, class_name: "Stoc", foreign_key: "Articulo"
  belongs_to :catgrupo, class_name:"Catgrupo", foreign_key: "Sector"
  belongs_to :catunidadmed, class_name:"Catunidadmed", foreign_key: "UniMed"



  has_many :productoenvase, class_name: "Productoenvase", foreign_key: "Producto"


  has_many :detalleld, class_name: "Detalle", foreign_key: "Articulo"
  has_many :detallelp, class_name: "Deta", foreign_key: "Articulo"

  has_many :relmens, class_name: "Relmen", foreign_key: "CodProducto"

  has_one :comision, class_name: "Comision", foreign_key: "producto_id"

  has_one :detalleprom, class_name:"Detalleprom", foreign_key: "Articulo"

  #Reportes
  has_many :detalledevol, class_name: "Detalledevo", foreign_key: "SKU"
  has_many :pregalado, class_name: "Pregalad", foreign_key: "SKU"
  has_one :productoneg, class_name: "Productoneg", foreign_key: "CodProd"
  has_many :recarga, class_name: "Recarg", foreign_key: "Articulo"


  has_attached_file :cover, styles: { thumb: "400x300", minithumb: "80x55" }
	#attached file q tiene un archivo adjunto, q es cover, el mismo campo agregado en la migracion. styles es para configuraciones, y especificamos las dos versiones de tamaños
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/#validacion para evitar ataques, y solo esperar un tipo de archivo en content type, como pdf, ejecutables, imagenes etc. con el tipo de archivo especificado, el usuario puede subir varios tipos de imagenes



  def self.to_csv(options = {})#exportar
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |producto|
        csv << producto.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)#importar
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      producto = find_by_Clave(row["Clave"]) || new
      producto.attributes = row.to_hash.slice(*row.to_hash.keys) #*row.to_hash.keys para rails 4 que sustituye el attr_accesible de rails 3
      producto.save!
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



  def self.bestseller(params)
      query =  joins("INNER JOIN DetalleVet ON Productos.Clave = DetalleVet.Articulo INNER JOIN Venta ON DetalleVet.Docto = Venta.Documento AND DetalleVet.RutaId = Venta.RutaId INNER JOIN ProductosXPzas ON Productos.Clave = ProductosXPzas.Producto")
            .select("DetalleVet.Articulo, SUM(CASE  WHEN  DetalleVet.Tipo=0 THEN DetalleVet.Pza * ProductosXPzas.PzaXCja ELSE DetalleVet.Pza END) AS count,Productos.Producto, Productos.Clave")
            .group("detallevet.Articulo, productos.Producto, productos.Clave").order("count DESC").limit(10)
            .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
      query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
      query
   end

   def self.worstseller(params)
      query =  joins("INNER JOIN DetalleVet ON Productos.Clave = DetalleVet.Articulo INNER JOIN Venta ON DetalleVet.Docto = Venta.Documento AND DetalleVet.RutaId = Venta.RutaId INNER JOIN ProductosXPzas ON Productos.Clave = ProductosXPzas.Producto")
            .select("DetalleVet.Articulo, SUM(CASE  WHEN  DetalleVet.Tipo=0 THEN DetalleVet.Pza * ProductosXPzas.PzaXCja ELSE DetalleVet.Pza END) AS count,Productos.Producto, Productos.Clave")
            .group("detallevet.Articulo, productos.Producto, productos.Clave").order("count ASC").limit(5)
            .where("(venta.RutaId = :rutaId or :rutaId = '') AND (venta.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
      query = query.where('venta.Fecha >= ? AND venta.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
      query
   end





end
