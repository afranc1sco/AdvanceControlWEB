# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170111011550) do

  create_table "Activos", primary_key: "IdActivos", force: :cascade do |t|
    t.string   "Descripcion",        limit: 255
    t.string   "Modelo",             limit: 255
    t.datetime "Fecha"
    t.string   "Serie",              limit: 50
    t.string   "CB",                 limit: 50
    t.string   "Status",             limit: 50
    t.varchar  "IdEmpresa",          limit: 50
    t.string   "cover_file_name",    limit: 4000
    t.string   "cover_content_type", limit: 4000
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  create_table "Ayudantes", primary_key: "id_ayudante", force: :cascade do |t|
    t.varchar_max "Nombre",      limit: 2147483647, null: false
    t.varchar_max "Direccion",   limit: 2147483647
    t.varchar     "Telefono",    limit: 50
    t.varchar     "IdEmpresa",   limit: 50
    t.boolean     "Status"
    t.varchar     "NumLicencia", limit: 255
    t.datetime    "VenceLic"
    t.varchar     "Clave",       limit: 50
  end

  create_table "BitacoraCuotas", primary_key: "Id", force: :cascade do |t|
    t.integer  "CuoId",  limit: 4
    t.datetime "Fecha"
    t.integer  "RutaId", limit: 4
    t.decimal  "Valor",            precision: 18, scale: 2
  end

  create_table "BitacoraTiempos", primary_key: "Id", force: :cascade do |t|
    t.varchar  "Codigo",      limit: 50
    t.varchar  "Descripcion", limit: 255
    t.datetime "HI"
    t.datetime "HF"
    t.varchar  "HT",          limit: 20
    t.varchar  "TS",          limit: 20
    t.boolean  "Visita"
    t.boolean  "Programado"
    t.integer  "DiaO",        limit: 4
    t.integer  "RutaId",      limit: 4
    t.boolean  "Cerrado"
    t.integer  "IdV",         limit: 4
    t.string   "Tip",         limit: 10
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "pila",        limit: 1
    t.varchar  "IdEmpresa",   limit: 50
  end

  add_index "BitacoraTiempos", ["Codigo", "DiaO", "RutaId", "HI"], name: "idxbitiedesdu"
  add_index "BitacoraTiempos", ["DiaO", "RutaId"], name: "idx_dia"
  add_index "BitacoraTiempos", ["DiaO", "RutaId"], name: "idxbitiediarut"
  add_index "BitacoraTiempos", ["HF"], name: "idxbitiefech"
  add_index "BitacoraTiempos", ["HI"], name: "idx_hi"
  add_index "BitacoraTiempos", ["HI"], name: "idxbitiefec"

  create_table "CP", id: false, force: :cascade do |t|
    t.integer "CP",        limit: 4
    t.varchar "Colonia",   limit: 100
    t.varchar "Municipio", limit: 75
    t.varchar "Estado",    limit: 50
    t.varchar "Ciudad",    limit: 75
  end

  add_index "CP", ["CP"], name: "idx_CP"

  create_table "CTiket", primary_key: "ID", force: :cascade do |t|
    t.varchar "Linea1",    limit: 255
    t.varchar "Linea2",    limit: 255
    t.varchar "Linea3",    limit: 255
    t.varchar "Linea4",    limit: 255
    t.varchar "Mensaje",   limit: 255
    t.boolean "Tdv"
    t.string  "LOGO",      limit: 4000
    t.boolean "MLiq"
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Cancelaciones", primary_key: "Id", force: :cascade do |t|
    t.string  "CodigoDKL", limit: 50
    t.decimal "Docto",                precision: 18, scale: 0
    t.string  "Tipo",      limit: 50
    t.integer "DiaO",      limit: 4
    t.string  "Llave",     limit: 50
    t.integer "RutaId",    limit: 4
  end

  create_table "CargaRuta", primary_key: "Id", force: :cascade do |t|
    t.varchar  "Articulo",  limit: 50
    t.datetime "Fecha"
    t.integer  "RutaId",    limit: 4
    t.boolean  "Tipo"
    t.integer  "Stock",     limit: 4
    t.varchar  "IdEmpresa", limit: 50
  end

  create_table "ClasClientes", primary_key: "IdClasC", force: :cascade do |t|
    t.text    "Descripcion", limit: 2147483647
    t.integer "NivelNum",    limit: 4
    t.integer "idsegmento",  limit: 4
  end

  create_table "ClasProductos", primary_key: "IdClasP", force: :cascade do |t|
    t.text    "Descripcion", limit: 2147483647
    t.integer "NivelNum",    limit: 4
    t.varchar "IdEmpresa",   limit: 50
  end

  create_table "ClasRutas", primary_key: "IdCRutas", force: :cascade do |t|
    t.varchar_max "Descripcion", limit: 2147483647
    t.integer     "NivelNum",    limit: 4
  end

  create_table "Clientes", primary_key: "IdCli", force: :cascade do |t|
    t.varchar "Nombre",         limit: 255
    t.varchar "NombreCorto",    limit: 100
    t.varchar "Direccion",      limit: 255
    t.string  "Referencia",     limit: 510
    t.string  "Telefono",       limit: 50
    t.char    "CP",             limit: 5
    t.boolean "Credito"
    t.money   "LimiteCredito",              precision: 19, scale: 4
    t.boolean "Status"
    t.integer "DiasCreedito",   limit: 4
    t.varchar "Colonia",        limit: 100
    t.string  "Tel2",           limit: 50
    t.string  "Email",          limit: 50,                           null: false
    t.boolean "VisitaObligada"
    t.boolean "FirmaObligada"
    t.integer "MotivoBajaId",   limit: 4
    t.money   "Saldo",                      precision: 19, scale: 4
    t.string  "Horario",        limit: 50
    t.integer "idclasc",        limit: 4
    t.varchar "IdEmpresa",      limit: 50
    t.float   "Longitud"
    t.float   "Latitud"
  end

  add_index "Clientes", ["CP"], name: "idx_CP"

  create_table "Clientes2", id: false, force: :cascade do |t|
    t.varchar "IdCli",          limit: 50,                           null: false
    t.varchar "Nombre",         limit: 255
    t.varchar "NombreCorto",    limit: 100
    t.varchar "Direccion",      limit: 255
    t.string  "Referencia",     limit: 510
    t.string  "Telefono",       limit: 50
    t.char    "CP",             limit: 5
    t.boolean "Credito"
    t.money   "LimiteCredito",              precision: 19, scale: 4
    t.boolean "Status"
    t.integer "DiasCreedito",   limit: 4
    t.varchar "Colonia",        limit: 100
    t.string  "Tel2",           limit: 50
    t.string  "Email",          limit: 50,                           null: false
    t.boolean "VisitaObligada"
    t.boolean "FirmaObligada"
    t.integer "MotivoBajaId",   limit: 4
    t.money   "Saldo",                      precision: 19, scale: 4
    t.string  "Horario",        limit: 50
    t.integer "idclasc",        limit: 4
    t.varchar "IdEmpresa",      limit: 50
    t.float   "Longitud"
    t.float   "Latitud"
  end

  create_table "Cobranza", force: :cascade do |t|
    t.varchar  "Cliente",      limit: 50
    t.string   "Documento",    limit: 50
    t.money    "Saldo",                   precision: 19, scale: 4
    t.integer  "Status",       limit: 4
    t.integer  "RutaId",       limit: 4
    t.string   "UltPago",      limit: 50
    t.datetime "FechaReg"
    t.datetime "FechaVence"
    t.integer  "FolioInterno", limit: 4
    t.string   "TipoDoc",      limit: 50
    t.integer  "DiaO",         limit: 4
    t.varchar  "IdEmpresa",    limit: 50
  end

  add_index "Cobranza", ["FechaReg"], name: "idxcobfecr"
  add_index "Cobranza", ["FechaVence"], name: "idxcobfecv"

  create_table "CodesOp", primary_key: "Codi", force: :cascade do |t|
    t.text    "Operacion", limit: 2147483647
    t.boolean "Tipo"
    t.varchar "IdEmpresa", limit: 50
    t.boolean "EsRecarga"
  end

  create_table "Comisiones", primary_key: "IdRow", force: :cascade do |t|
    t.string  "Comision",  limit: 50
    t.boolean "Activa"
    t.decimal "Tipo",                 precision: 18, scale: 0
    t.string  "Factor",    limit: 50
    t.decimal "Niveles",              precision: 18, scale: 0
    t.string  "Clave",     limit: 50
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "ConfigRutasP", primary_key: "Id", force: :cascade do |t|
    t.integer "RutaId",       limit: 4
    t.string  "ModelPrinter", limit: 50
    t.string  "VelCom",       limit: 50
    t.string  "COM",          limit: 50
    t.varchar "Server",       limit: 255
    t.integer "Puerto",       limit: 4
    t.string  "ServerGPS",    limit: 50
    t.boolean "GPS"
    t.string  "PuertoG",      limit: 50
    t.boolean "PagoContado"
    t.boolean "CteNvo"
    t.boolean "CveCteNvo"
    t.varchar "IdEmpresa",    limit: 50
    t.boolean "SugerirCant"
    t.boolean "PromoEq"
  end

  create_table "Configuracion", primary_key: "Clave", force: :cascade do |t|
    t.boolean "EliminarClasRutas"
    t.boolean "EliminarClasClientes"
    t.boolean "EliminarClasProductos"
    t.text    "PrimerLineaTickets",    limit: 2147483647
    t.text    "SegundaLinea",          limit: 2147483647
    t.text    "TercerLinea",           limit: 2147483647
    t.text    "CuartaLinea",           limit: 2147483647
    t.text    "MensajeFinal",          limit: 2147483647
    t.boolean "HabilitarTdV"
    t.text    "MensajeTdV",            limit: 2147483647
    t.integer "Pedidos",               limit: 4
    t.integer "Ventas",                limit: 4
    t.varchar "IdEmpresa",             limit: 50
  end

  create_table "ConfiguracionGral", primary_key: "ID_Config", force: :cascade do |t|
    t.varchar     "Nombre",      limit: 50,         null: false
    t.varchar_max "Descripcion", limit: 2147483647
    t.varchar     "Valor",       limit: 50
    t.varchar     "IdEmpresa",   limit: 50
  end

  create_table "ContadorNC", primary_key: "Idrow", force: :cascade do |t|
    t.string  "Ruta",      limit: 100
    t.string  "Contador",  limit: 500
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Continuidad", primary_key: "RutaID", force: :cascade do |t|
    t.integer "DiaO",      limit: 4
    t.integer "FolVta",    limit: 4
    t.integer "FolPed",    limit: 4
    t.integer "FolDevol",  limit: 4
    t.integer "FolCob",    limit: 4
    t.integer "UDiaO",     limit: 4
    t.varchar "CteNvo",    limit: 50
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Cuotas", primary_key: "Id", force: :cascade do |t|
    t.string   "Clave",       limit: 50
    t.text     "Descripcion", limit: 2147483647
    t.string   "UniMed",      limit: 50
    t.string   "Cantidad",    limit: 50
    t.datetime "FechaI"
    t.datetime "FechaF"
    t.varchar  "Producto",    limit: 50
    t.boolean  "Tipo"
    t.boolean  "Activa"
    t.integer  "NivelNum",    limit: 4
    t.varchar  "IdEmpresa",   limit: 50
  end

  create_table "DetalleCob", primary_key: "Id", force: :cascade do |t|
    t.integer  "IdCobranza", limit: 4
    t.money    "Abono",                 precision: 19, scale: 4
    t.datetime "Fecha"
    t.integer  "RutaId",     limit: 4
    t.money    "SaldoAnt",              precision: 19, scale: 4
    t.money    "Saldo",                 precision: 19, scale: 4
    t.integer  "FormaP",     limit: 4
    t.integer  "DiaO",       limit: 4
    t.string   "Documento",  limit: 50
    t.string   "Cliente",    limit: 50
    t.varchar  "IdEmpresa",  limit: 50
    t.boolean  "Cancelada"
  end

  add_index "DetalleCob", ["Fecha"], name: "idxdetcobfec"
  add_index "DetalleCob", ["FormaP"], name: "idxfdetcobfpag"
  add_index "DetalleCob", ["IdCobranza"], name: "idxdetcobfk"

  create_table "DetalleCobduplicados", id: false, force: :cascade do |t|
    t.integer  "Id",         limit: 4,                           null: false
    t.integer  "IdCobranza", limit: 4
    t.money    "Abono",                 precision: 19, scale: 4
    t.datetime "Fecha"
    t.integer  "RutaId",     limit: 4
    t.money    "SaldoAnt",              precision: 19, scale: 4
    t.money    "Saldo",                 precision: 19, scale: 4
    t.integer  "FormaP",     limit: 4
    t.integer  "DiaO",       limit: 4
    t.string   "Documento",  limit: 50
    t.string   "Cliente",    limit: 50
    t.integer  "DUPLICADO",  limit: 4
  end

  create_table "DetalleDevol", primary_key: "Id", force: :cascade do |t|
    t.string  "SKU",       limit: 50
    t.integer "Pza",       limit: 4
    t.decimal "KG",                           precision: 18, scale: 2
    t.money   "Precio",                       precision: 19, scale: 4
    t.money   "Importe",                      precision: 19, scale: 4
    t.boolean "EDO"
    t.text    "Motivo",    limit: 2147483647
    t.money   "IVA",                          precision: 19, scale: 4
    t.money   "IEPS",                         precision: 19, scale: 4
    t.integer "Devol",     limit: 4
    t.integer "Docto",     limit: 4
    t.integer "RutaId",    limit: 4
    t.integer "Tipo",      limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "DetalleDevol", ["RutaId"], name: "idxdetdevruta"

  create_table "DetalleLD", force: :cascade do |t|
    t.integer "ListaId",   limit: 4
    t.varchar "Articulo",  limit: 50
    t.decimal "Factor",               precision: 18, scale: 4
    t.decimal "Minimo",               precision: 18, scale: 4
    t.decimal "Maximo",               precision: 18, scale: 4
    t.char    "Tipo",      limit: 1
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "DetalleLD", ["Articulo"], name: "idxdetldart"
  add_index "DetalleLD", ["ListaId"], name: "idxdetldlista"

  create_table "DetalleLP", force: :cascade do |t|
    t.integer "ListaId",   limit: 4
    t.varchar "Articulo",  limit: 50
    t.string  "PrecioMin", limit: 50
    t.string  "PrecioMax", limit: 50
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "DetalleLP", ["Articulo"], name: "idxdetlpdart"
  add_index "DetalleLP", ["ListaId"], name: "idxdetlplista"

  create_table "DetalleLProMaster", primary_key: "Id", force: :cascade do |t|
    t.integer "IdLm",      limit: 4
    t.integer "IdPromo",   limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "DetallePedidos", primary_key: "Id", force: :cascade do |t|
    t.varchar "SKU",         limit: 50
    t.integer "Pza",         limit: 4
    t.decimal "KG",                      precision: 18, scale: 2
    t.money   "Precio",                  precision: 19, scale: 4
    t.money   "Importe",                 precision: 19, scale: 4
    t.money   "IVA",                     precision: 19, scale: 4
    t.money   "IEPS",                    precision: 19, scale: 4
    t.integer "Docto",       limit: 4
    t.decimal "DesctoPor",               precision: 18, scale: 2
    t.decimal "DesctoV",                 precision: 18, scale: 2
    t.integer "RutaId",      limit: 4
    t.integer "Vendedo",     limit: 4
    t.varchar "Descripcion", limit: 255
    t.integer "Tipo",        limit: 4
    t.varchar "IdEmpresa",   limit: 50
  end

  create_table "DetallePromo", primary_key: "Id", force: :cascade do |t|
    t.varchar "Articulo",  limit: 50
    t.integer "PromoId",   limit: 4
    t.decimal "Cantidad",             precision: 18, scale: 0
    t.boolean "Tipo"
    t.string  "TipoProm",  limit: 50
    t.string  "Monto",     limit: 50
    t.nchar   "Volumen",   limit: 10
    t.integer "TipMed",    limit: 4
    t.varchar "IdEmpresa", limit: 50
    t.integer "Nivel",     limit: 4
  end

  create_table "DetalleSalidas", id: false, force: :cascade do |t|
    t.integer "IDSalida",  limit: 4
    t.varchar "Articulo",  limit: 50
    t.integer "Cantidad",  limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "DetalleVet", primary_key: "ID", force: :cascade do |t|
    t.varchar "Articulo",    limit: 50
    t.text    "Descripcion", limit: 2147483647
    t.money   "Precio",                         precision: 19, scale: 4
    t.integer "Pza",         limit: 4
    t.decimal "Kg",                             precision: 18, scale: 2
    t.string  "DescPorc",    limit: 50
    t.decimal "DescMon",                        precision: 18, scale: 2
    t.integer "Tipo",        limit: 4
    t.integer "Docto",       limit: 4
    t.money   "Importe",                        precision: 19, scale: 4
    t.money   "IVA",                            precision: 19, scale: 4
    t.money   "IEPS",                           precision: 19, scale: 4
    t.integer "RutaId",      limit: 4
    t.varchar "IdEmpresa",   limit: 50
  end

  add_index "DetalleVet", ["Articulo", "Docto", "RutaId"], name: "IX_DetalleVet", unique: true
  add_index "DetalleVet", ["Articulo"], name: "idx_articulo"
  add_index "DetalleVet", ["Docto", "RutaId"], name: "idx_ruta"

  create_table "DevEnvases", primary_key: "ID", force: :cascade do |t|
    t.integer "RutaId",    limit: 4
    t.integer "DiaO",      limit: 4
    t.varchar "CodCli",    limit: 50
    t.integer "Docto",     limit: 4
    t.varchar "Articulo",  limit: 50
    t.integer "Cantidad",  limit: 4
    t.integer "Devuelto",  limit: 4
    t.string  "Tipo",      limit: 100
    t.varchar "Envase",    limit: 50
    t.char    "Status",    limit: 1
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Devoluciones", primary_key: "Id", force: :cascade do |t|
    t.varchar  "CodCliente", limit: 50
    t.integer  "Devol",      limit: 4
    t.datetime "Fecha"
    t.decimal  "Status",                 precision: 18, scale: 0
    t.integer  "Ruta",       limit: 4
    t.integer  "Vendedor",   limit: 4
    t.integer  "Items",      limit: 4
    t.decimal  "KG",                     precision: 18, scale: 2
    t.money    "IVA",                    precision: 19, scale: 4
    t.money    "IEPS",                   precision: 19, scale: 4
    t.money    "Subtotal",               precision: 19, scale: 4
    t.money    "Total",                  precision: 19, scale: 4
    t.varchar  "EnLetras",   limit: 255
    t.integer  "DiaO",       limit: 4
    t.integer  "Docto",      limit: 4
    t.boolean  "Cancelada"
    t.varchar  "IdEmpresa",  limit: 50
  end

  create_table "Dias", primary_key: "Id", force: :cascade do |t|
    t.string "Dia", limit: 50
  end

  create_table "DiasO", primary_key: "DiaO", force: :cascade do |t|
    t.integer "Id",        limit: 4,                           null: false
    t.date    "Fecha"
    t.integer "RutaId",    limit: 4,                           null: false
    t.decimal "VProg",                precision: 18, scale: 0
    t.decimal "Ve",                   precision: 18, scale: 0
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "DiasO", ["Fecha"], name: "idx_Fecha"

  create_table "DiasOperativos", primary_key: "Clave", force: :cascade do |t|
    t.integer "Dia",          limit: 4
    t.integer "RutaId",       limit: 4
    t.integer "Ventas",       limit: 4
    t.integer "VentasCre",    limit: 4
    t.integer "Devoluciones", limit: 4
    t.integer "Pedidos",      limit: 4
  end

  create_table "Empresas", primary_key: "IdEmpresa", force: :cascade do |t|
    t.string  "Direccion",       limit: 4000
    t.string  "Telefono",        limit: 4000
    t.string  "Contacto",        limit: 4000
    t.string  "Email",           limit: 4000
    t.string  "NoExterior",      limit: 4000
    t.string  "NoInterior",      limit: 4000
    t.string  "CP",              limit: 4000
    t.integer "empresamadre_id", limit: 4
    t.string  "Sucursal",        limit: 4000
    t.string  "NombreComercial", limit: 4000
  end

  add_index "Empresas", ["empresamadre_id"], name: "index_empresas_on_empresamadre_id"

  create_table "Encuestas", primary_key: "Clave_Enc", force: :cascade do |t|
    t.integer "ID",        limit: 4,  null: false
    t.varchar "Desc_Enc",  limit: 50
    t.varchar "Tipo_Enc",  limit: 50
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "FormasPag", primary_key: "IdFpag", force: :cascade do |t|
    t.text    "Forma",     limit: 2147483647
    t.text    "Clave",     limit: 2147483647
    t.boolean "Status"
    t.string  "IdEmpresa", limit: 4000
  end

  create_table "HistoricoActivo", primary_key: "consec", force: :cascade do |t|
    t.integer  "IdActivos",       limit: 4,   null: false
    t.varchar  "IdCli",           limit: 50
    t.datetime "FechaAsignacion"
    t.datetime "FechaDevol"
    t.integer  "Status",          limit: 4
    t.varchar  "Comentario",      limit: 200
    t.varchar  "IdEmpresa",       limit: 50
  end

  create_table "Liquidacion", primary_key: "Id", force: :cascade do |t|
    t.string  "SKU",          limit: 50
    t.text    "Producto",     limit: 2147483647
    t.decimal "InvIP",                           precision: 18, scale: 2
    t.decimal "InvIK",                           precision: 18, scale: 2
    t.decimal "SutidoP",                         precision: 18, scale: 2
    t.decimal "SurtidoK",                        precision: 18, scale: 2
    t.decimal "DevolucionP",                     precision: 18, scale: 2
    t.decimal "DevolucionK",                     precision: 18, scale: 2
    t.decimal "PromocionesP",                    precision: 18, scale: 2
    t.decimal "PromocionesK",                    precision: 18, scale: 2
    t.decimal "InvFP",                           precision: 18, scale: 2
    t.decimal "InvFk",                           precision: 18, scale: 2
    t.decimal "VtaTeoricaP",                     precision: 18, scale: 2
    t.decimal "VtaTeoricaK",                     precision: 18, scale: 2
    t.decimal "VtaRealP",                        precision: 18, scale: 2
    t.decimal "VtaRealK",                        precision: 18, scale: 2
    t.decimal "DiferenciaP",                     precision: 18, scale: 2
    t.decimal "DiferenciaK",                     precision: 18, scale: 2
    t.decimal "Importe",                         precision: 18, scale: 2
    t.integer "RutaId",       limit: 4
    t.integer "DiaO",         limit: 4
    t.string  "Fecha",        limit: 50
  end

  create_table "ListaD", force: :cascade do |t|
    t.text    "Lista",     limit: 2147483647
    t.char    "Tipo",      limit: 1
    t.boolean "Caduca"
    t.date    "FechaIni"
    t.date    "FechaFin"
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "ListaP", force: :cascade do |t|
    t.text     "Lista",     limit: 2147483647
    t.boolean  "Tipo"
    t.datetime "FechaIni"
    t.datetime "FechaFin"
    t.varchar  "IdEmpresa", limit: 50
  end

  create_table "ListaPromo", force: :cascade do |t|
    t.text     "Lista",       limit: 2147483647
    t.text     "Descripcion", limit: 2147483647
    t.boolean  "Caduca"
    t.datetime "FechaI"
    t.datetime "FechaF"
    t.text     "Grupo",       limit: 2147483647
    t.boolean  "Activa"
    t.string   "Tipo",        limit: 50
    t.varchar  "IdEmpresa",   limit: 50
  end

  create_table "ListaPromoMaster", primary_key: "Id", force: :cascade do |t|
    t.text    "ListaMaster", limit: 2147483647
    t.string  "Promociones", limit: 50
    t.varchar "IdEmpresa",   limit: 50
  end

  create_table "Medidores", primary_key: "IdRow", force: :cascade do |t|
    t.integer "IdRuta",          limit: 4
    t.integer "DiaO",            limit: 4
    t.decimal "OdometroInicial",            precision: 18, scale: 0
    t.decimal "OdometroFinal",              precision: 18, scale: 0
    t.decimal "TanqueInicial",              precision: 18, scale: 2
    t.decimal "TanqueFinal",                precision: 18, scale: 2
    t.decimal "LitrosCargados",             precision: 18, scale: 0
    t.decimal "GastoLitros",                precision: 18, scale: 2
    t.decimal "Rendimiento",                precision: 18, scale: 2
    t.decimal "KmR",                        precision: 18, scale: 2
    t.varchar "IdEmpresa",       limit: 50
  end

  create_table "Mensajes", primary_key: "ID", force: :cascade do |t|
    t.string   "Clave",       limit: 50
    t.text     "EnBaseA",     limit: 2147483647
    t.text     "Descripcion", limit: 2147483647
    t.varchar  "Mensaje",     limit: 255
    t.datetime "FechaInicio"
    t.datetime "FechaFinal"
    t.boolean  "Estado"
    t.varchar  "IdEmpresa",   limit: 50
  end

  create_table "Mermas", primary_key: "Id", force: :cascade do |t|
    t.varchar  "Articulo",  limit: 50
    t.string   "Merma",     limit: 50
    t.datetime "Fecha"
    t.integer  "RutaId",    limit: 4
    t.varchar  "IdEmpresa", limit: 50
  end

  create_table "MotivosNoVenta", primary_key: "IdMot", force: :cascade do |t|
    t.text    "Motivo", limit: 2147483647
    t.text    "Clave",  limit: 2147483647
    t.boolean "Status"
  end

  create_table "MotivosSalida", primary_key: "ID", force: :cascade do |t|
    t.varchar "Motivo", limit: 255
  end

  create_table "MvoDev", primary_key: "Id", force: :cascade do |t|
    t.text    "MvoDev",    limit: 2147483647
    t.string  "Clave",     limit: 50
    t.boolean "Status"
    t.string  "IdEmpresa", limit: 4000
  end

  create_table "MvoMerma", primary_key: "Id", force: :cascade do |t|
    t.text    "Merma",     limit: 2147483647
    t.string  "Clave",     limit: 50
    t.boolean "Status"
    t.string  "IdEmpresa", limit: 4000
  end

  create_table "MvtosInv", primary_key: "IdMovStock", force: :cascade do |t|
    t.text     "Movto",     limit: 2147483647
    t.varchar  "Articulo",  limit: 50
    t.decimal  "stockant",                     precision: 18, scale: 0
    t.decimal  "Stockact",                     precision: 18, scale: 0
    t.datetime "fecha"
    t.integer  "RutaO",     limit: 4
    t.integer  "RutaD",     limit: 4
    t.varchar  "IdEmpresa", limit: 50
  end

  add_index "MvtosInv", ["fecha"], name: "idxmvtinvfec"

  create_table "Noventas", primary_key: "Id", force: :cascade do |t|
    t.varchar  "Cliente",    limit: 50
    t.integer  "MotivoId",   limit: 4
    t.datetime "Fecha"
    t.integer  "DiaO",       limit: 4
    t.integer  "RutaId",     limit: 4
    t.integer  "VendedorId", limit: 4
    t.varchar  "IdEmpresa",  limit: 50
  end

  create_table "Opc_Enc", id: false, force: :cascade do |t|
    t.varchar "Clave_Enc", limit: 50,  null: false
    t.integer "Num_Preg",  limit: 4,   null: false
    t.char    "Num_Resp",  limit: 1,   null: false
    t.varchar "Desc_Resp", limit: 255
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "OperacionD", primary_key: "Id", force: :cascade do |t|
    t.text    "CodCliente",      limit: 2147483647
    t.text    "Cliente",         limit: 2147483647
    t.string  "HoraI",           limit: 50
    t.string  "HoraF",           limit: 50
    t.string  "Traslado",        limit: 50
    t.string  "Servicio",        limit: 50
    t.text    "Operacion",       limit: 2147483647
    t.boolean "Programado"
    t.decimal "VentasContadoKg",                    precision: 18, scale: 2
    t.money   "VentasContado",                      precision: 19, scale: 4
    t.decimal "VentasCreditoKg",                    precision: 18, scale: 2
    t.money   "VentasCredito",                      precision: 19, scale: 4
    t.text    "NoVenta",         limit: 2147483647
    t.decimal "DevBEKG",                            precision: 18, scale: 2
    t.decimal "DevBe",                              precision: 18, scale: 2
    t.decimal "DevMEKG",                            precision: 18, scale: 2
    t.decimal "DevMe",                              precision: 18, scale: 2
    t.integer "DiaO",            limit: 4
    t.integer "Ruta",            limit: 4
    t.integer "ClaveRuta",       limit: 4
  end

  create_table "PContado", primary_key: "Id", force: :cascade do |t|
    t.string  "SKU",       limit: 50
    t.integer "RutaId",    limit: 4
    t.decimal "Pz",                   precision: 18, scale: 2
    t.decimal "Kg",                   precision: 18, scale: 2
    t.integer "DiaO",      limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "PRegalado", primary_key: "Id", force: :cascade do |t|
    t.string  "SKU",       limit: 50
    t.integer "RutaId",    limit: 4
    t.decimal "Pz",                   precision: 18, scale: 2
    t.decimal "Kg",                   precision: 18, scale: 2
    t.integer "DiaO",      limit: 4
    t.integer "Docto",     limit: 4
    t.varchar "Cliente",   limit: 50
    t.integer "Cant",      limit: 4
    t.string  "Tipmed",    limit: 8
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "PRegalado", ["Cliente"], name: "idxpregcli"
  add_index "PRegalado", ["DiaO", "RutaId"], name: "idxpregdiarut"

  create_table "PVendidos", primary_key: "ID", force: :cascade do |t|
    t.string  "SKU",       limit: 50,                          null: false
    t.integer "RutaId",    limit: 4
    t.decimal "Pz",                   precision: 18, scale: 2
    t.decimal "KG",                   precision: 18, scale: 2
    t.integer "DiaO",      limit: 4
    t.integer "Tipo",      limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Pagos", primary_key: "Id", force: :cascade do |t|
    t.text    "Cliente", limit: 2147483647
    t.integer "RutaId",  limit: 4
    t.integer "DiaO",    limit: 4
    t.money   "Pago",                       precision: 19, scale: 4
  end

  create_table "PedDiaSig", primary_key: "ID", force: :cascade do |t|
    t.integer "IdRuta",    limit: 4,  null: false
    t.varchar "Articulo",  limit: 50, null: false
    t.integer "Cantidad",  limit: 4,  null: false
    t.date    "Fecha"
    t.integer "Diao",      limit: 4
    t.varchar "IdEmpresa", limit: 50
    t.varchar "Folio",     limit: 50
  end

  add_index "PedDiaSig", ["Articulo", "Diao", "IdRuta", "IdEmpresa"], name: "IX_PedDiaSig"
  add_index "PedDiaSig", ["Fecha"], name: "idxpdsfec"

  create_table "PedDiaSigPzs", primary_key: "ID", force: :cascade do |t|
    t.integer "IdRuta",    limit: 4,  null: false
    t.varchar "Articulo",  limit: 50, null: false
    t.integer "Cantidad",  limit: 4,  null: false
    t.date    "Fecha"
    t.integer "Diao",      limit: 4
    t.varchar "IdEmpresa", limit: 50
    t.varchar "Folio",     limit: 50
  end

  add_index "PedDiaSigPzs", ["Articulo", "Diao", "IdRuta", "IdEmpresa"], name: "IX_PedDiaSigPzs"

  create_table "Pedidos", primary_key: "IdPedido", force: :cascade do |t|
    t.integer  "Pedido",       limit: 4
    t.datetime "Fecha"
    t.varchar  "CodCliente",   limit: 50
    t.string   "Tipo",         limit: 50
    t.money    "IVA",                      precision: 19, scale: 4
    t.money    "IEPS",                     precision: 19, scale: 4
    t.money    "Subt",                     precision: 19, scale: 4
    t.money    "Total",                    precision: 19, scale: 4
    t.integer  "Items",        limit: 4
    t.varchar  "EnLetras",     limit: 255
    t.integer  "Status",       limit: 4
    t.integer  "Ruta",         limit: 4
    t.integer  "Vendedor",     limit: 4
    t.datetime "FechaVe"
    t.integer  "DiaO",         limit: 4
    t.varchar  "DocSalida",    limit: 50
    t.boolean  "Cancelado"
    t.decimal  "Kg",                       precision: 18, scale: 2
    t.datetime "FechaEntrega"
    t.varchar  "IdEmpresa",    limit: 50
  end

  create_table "Perfiles", primary_key: "IdPerfiles", force: :cascade do |t|
    t.boolean "Altas"
    t.boolean "Bajas"
    t.boolean "Modi"
    t.boolean "Listar"
    t.varchar "Modulo",      limit: 50
    t.integer "IdUser",      limit: 4
    t.boolean "Aceso"
    t.integer "Codigo",      limit: 4
    t.boolean "usaPw"
    t.boolean "Otro"
    t.varchar "Descripcion", limit: 50
  end

  add_index "Perfiles", ["IdUser", "Codigo"], name: "idx_perfil"
  add_index "Perfiles", ["Modulo"], name: "idx_modulo"

  create_table "PreAbonos", force: :cascade do |t|
    t.integer "Cuenta",        limit: 4
    t.decimal "Abono",                            precision: 18, scale: 2
    t.text    "FormaP",        limit: 2147483647
    t.text    "Referencia",    limit: 2147483647
    t.text    "Observaciones", limit: 2147483647
  end

  create_table "Preg_Enc", primary_key: "Clave_Enc", force: :cascade do |t|
    t.integer "Num_Preg",  limit: 4,   null: false
    t.varchar "Des_Preg",  limit: 255, null: false
    t.varchar "Tipo_Preg", limit: 50
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "Preg_Enc", ["Clave_Enc"], name: "idx_clave"
  add_index "Preg_Enc", ["Num_Preg"], name: "idx_pregunta"

  create_table "ProductoEnvase", primary_key: "Id", force: :cascade do |t|
    t.varchar "Producto",  limit: 50
    t.text    "Envase",    limit: 2147483647
    t.integer "Cant_Base", limit: 4
    t.integer "Cant_Eq",   limit: 4
    t.char    "Status",    limit: 1
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "ProductoNegado", force: :cascade do |t|
    t.string  "CodProd",   limit: 50
    t.string  "Fecha",     limit: 50
    t.decimal "Pidieron",             precision: 18, scale: 2
    t.decimal "Habia",                precision: 18, scale: 2
    t.integer "DiaO",      limit: 4
    t.integer "RutaId",    limit: 4
    t.integer "Docto",     limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "ProductoPaseado", primary_key: "Id", force: :cascade do |t|
    t.string  "CodProd",   limit: 50
    t.integer "RutaId",    limit: 4,                           null: false
    t.integer "DiaO",      limit: 4
    t.decimal "Stock",                precision: 18, scale: 2
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "ProductoPaseado", ["CodProd", "DiaO", "IdEmpresa"], name: "IX_ProductoPaseado"

  create_table "Productos", primary_key: "Clave", force: :cascade do |t|
    t.integer  "Id",                 limit: 4,                             null: false
    t.varchar  "Producto",           limit: 255
    t.varchar  "CodBarras",          limit: 50
    t.boolean  "Granel"
    t.integer  "IVA",                limit: 1
    t.integer  "IEPS",               limit: 1
    t.varchar  "UniMed",             limit: 50
    t.money    "VBase",                           precision: 19, scale: 4
    t.float    "Equivalente"
    t.varchar  "Sector",             limit: 50
    t.boolean  "Ban_Envase"
    t.string   "Foto",               limit: 4000
    t.integer  "idclasp",            limit: 4
    t.varchar  "IdEmpresa",          limit: 50
    t.char     "Status",             limit: 1
    t.string   "cover_file_name",    limit: 4000
    t.string   "cover_content_type", limit: 4000
    t.integer  "cover_file_size",    limit: 4
    t.datetime "cover_updated_at"
  end

  create_table "ProductosXPzas", primary_key: "Producto", force: :cascade do |t|
    t.integer "IDP",       limit: 4,  null: false
    t.integer "PzaXCja",   limit: 4,  null: false
    t.integer "StockxP",   limit: 4
    t.varchar "IdEmpresa", limit: 50, null: false
  end

  create_table "Promociones", force: :cascade do |t|
    t.text    "Promocion", limit: 2147483647
    t.string  "FecInicio", limit: 50
    t.string  "FecFinal",  limit: 50
    t.integer "IdLista",   limit: 4
  end

  create_table "RanComisiones", primary_key: "IdRow", force: :cascade do |t|
    t.decimal "RangoA",                precision: 18, scale: 2
    t.decimal "RangoF",                precision: 18, scale: 2
    t.integer "ComisionId", limit: 4
    t.string  "Valor",      limit: 50
    t.decimal "Nivel",                 precision: 18, scale: 0
    t.decimal "Comision",              precision: 18, scale: 2
  end

  create_table "Recarga", primary_key: "ID", force: :cascade do |t|
    t.integer  "IdRuta",    limit: 4,  null: false
    t.varchar  "Articulo",  limit: 50, null: false
    t.integer  "Cantidad",  limit: 4,  null: false
    t.datetime "Fecha"
    t.integer  "Diao",      limit: 4
    t.varchar  "IdEmpresa", limit: 50
    t.varchar  "Folio",     limit: 50
    t.datetime "Hora"
  end

  create_table "RegLicencias", primary_key: "Clave", force: :cascade do |t|
    t.string  "LicenciaMaster", limit: 50
    t.text    "Empresa",        limit: 2147483647
    t.text    "RFC",            limit: 2147483647
    t.integer "Rew34",          limit: 4
    t.text    "LicPocK",        limit: 2147483647
    t.integer "Rew35",          limit: 4
    t.text    "Email",          limit: 2147483647
    t.string  "Re54",           limit: 50
    t.string  "Re55",           limit: 50
    t.string  "Re56",           limit: 50
    t.string  "Re57",           limit: 50
    t.text    "Ref56",          limit: 2147483647
    t.integer "We34",           limit: 4
    t.integer "We35",           limit: 4
  end

  create_table "RegPC", primary_key: "Clave", force: :cascade do |t|
    t.string  "PC",       limit: 50
    t.string  "Licencia", limit: 50
    t.integer "Status",   limit: 4
    t.text    "CodeVer",  limit: 2147483647
  end

  create_table "RelActivos", primary_key: "IdRow", force: :cascade do |t|
    t.varchar  "Cliente",         limit: 50
    t.integer  "Activo",          limit: 4
    t.datetime "FechaAsignacion"
    t.varchar  "IdEmpresa",       limit: 50
  end

  add_index "RelActivos", ["Cliente"], name: "idxrelactcli"

  create_table "RelCliClas", primary_key: "IdRcC", force: :cascade do |t|
    t.varchar "IdCliente", limit: 50
    t.integer "Clas1",     limit: 4
    t.integer "Clas2",     limit: 4
    t.integer "Clas3",     limit: 4
    t.integer "Clas4",     limit: 4
    t.integer "Clas5",     limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "RelCliClas", ["IdCliente"], name: "idxrelclscli"

  create_table "RelCliLis", primary_key: "Id", force: :cascade do |t|
    t.varchar "CodCliente", limit: 50, null: false
    t.integer "ListaP",     limit: 4
    t.integer "ListaD",     limit: 4
    t.integer "ListaPromo", limit: 4
    t.integer "DiaVisita",  limit: 4
    t.varchar "IdEmpresa",  limit: 50
  end

  add_index "RelCliLis", ["CodCliente"], name: "idxrelliscli"

  create_table "RelClirutas", primary_key: "Id", force: :cascade do |t|
    t.varchar "IdCliente", limit: 50
    t.integer "IdRuta",    limit: 4
    t.varchar "IdEmpresa", limit: 50
    t.date    "Fecha"
  end

  add_index "RelClirutas", ["IdCliente"], name: "idx_cliente"
  add_index "RelClirutas", ["IdCliente"], name: "idxrelrutcli"
  add_index "RelClirutas", ["IdRuta"], name: "idx_ruta"

  create_table "RelCuoVend", primary_key: "Id", force: :cascade do |t|
    t.integer "CuoId",     limit: 4
    t.integer "VendeId",   limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "RelDayCli", primary_key: "Id", force: :cascade do |t|
    t.varchar "CodCli",    limit: 50
    t.integer "Lunes",     limit: 4
    t.integer "Martes",    limit: 4
    t.integer "Miercoles", limit: 4
    t.integer "Jueves",    limit: 4
    t.integer "Viernes",   limit: 4
    t.integer "Sabado",    limit: 4
    t.integer "Domingo",   limit: 4
    t.integer "RutaId",    limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "RelDayCli", ["CodCli"], name: "idx_cliente"
  add_index "RelDayCli", ["CodCli"], name: "idxreldaycli"
  add_index "RelDayCli", ["RutaId"], name: "idx_ruta"

  create_table "RelMens", primary_key: "IDRow", force: :cascade do |t|
    t.decimal "MenId",                          precision: 18, scale: 0
    t.text    "CodCliente",  limit: 2147483647
    t.integer "IdCliente",   limit: 4
    t.text    "CodProducto", limit: 2147483647
    t.integer "IdProducto",  limit: 4
    t.integer "CodRuta",     limit: 4
    t.integer "IdRuta",      limit: 4
    t.varchar "IdEmpresa",   limit: 50
  end

  create_table "RelOperaciones", primary_key: "IdK", force: :cascade do |t|
    t.decimal  "Id",                   precision: 18, scale: 0, null: false
    t.integer  "Folio",     limit: 4
    t.integer  "RutaId",    limit: 4
    t.integer  "DiaO",      limit: 4
    t.varchar  "CodCli",    limit: 50
    t.string   "Tipo",      limit: 50
    t.money    "Total",                precision: 19, scale: 4
    t.datetime "Fecha"
    t.varchar  "IdEmpresa", limit: 50
  end

  create_table "RelProClas", primary_key: "IdRelPClas", force: :cascade do |t|
    t.varchar "ProductoId", limit: 50
    t.integer "Clasif",     limit: 4
    t.integer "Nivel",      limit: 4
    t.integer "Dep_Clasif", limit: 4
    t.integer "Dep_Nivel",  limit: 4
    t.varchar "IdEmpresa",  limit: 50
  end

  add_index "RelProClas", ["ProductoId"], name: "idx_ProductoId"

  create_table "RelRuClas", primary_key: "IdRelRClas", force: :cascade do |t|
    t.integer "RutaId",    limit: 4,  null: false
    t.integer "Clas1",     limit: 4,  null: false
    t.integer "Clas2",     limit: 4,  null: false
    t.integer "Clas3",     limit: 4,  null: false
    t.integer "Clas4",     limit: 4,  null: false
    t.integer "Clas5",     limit: 4,  null: false
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Rel_EncRut", id: false, force: :cascade do |t|
    t.string  "Clave_Enc", limit: 50
    t.integer "Id_Ruta",   limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "Rel_EncRut", ["Clave_Enc"], name: "idx_clave"

  create_table "ResCuotas", primary_key: "Id", force: :cascade do |t|
    t.integer "CuoId",     limit: 4
    t.integer "RutaId",    limit: 4
    t.decimal "Valor",                precision: 18, scale: 2
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Res_Stock", primary_key: "IdStock", force: :cascade do |t|
    t.varchar "Articulo",  limit: 50
    t.integer "Stock",     limit: 4
    t.integer "Ruta",      limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  create_table "Resp_Enc", id: false, force: :cascade do |t|
    t.varchar  "Clave_Enc",    limit: 50
    t.integer  "Num_Pregunta", limit: 4
    t.integer  "IdRuta",       limit: 4
    t.varchar  "Des_Resp",     limit: 255
    t.varchar  "IdCliente",    limit: 50
    t.datetime "Fecha"
    t.integer  "DiaO",         limit: 4
    t.varchar  "IdEmpresa",    limit: 50
  end

  add_index "Resp_Enc", ["Clave_Enc"], name: "idx_clave"
  add_index "Resp_Enc", ["Num_Pregunta", "IdRuta"], name: "idx_pregunta"

  create_table "Rutas", primary_key: "IdRutas", force: :cascade do |t|
    t.varchar "Ruta",             limit: 255,                 null: false
    t.boolean "Activa",                                       null: false
    t.varchar "TipoRuta",         limit: 255,                 null: false
    t.integer "VenSinStock",      limit: 4,   default: 0,     null: false
    t.varchar "Oficina",          limit: 255,                 null: false
    t.varchar "Sector",           limit: 255,                 null: false
    t.integer "Vendedor",         limit: 4
    t.integer "Tipo",             limit: 4,   default: 0,     null: false
    t.integer "id_ayudante1",     limit: 4,   default: 0
    t.integer "id_ayudante2",     limit: 4,   default: 0
    t.boolean "VendedorAyudante",             default: false, null: false
    t.boolean "Foranea",                      default: false
    t.integer "vehiculo",         limit: 4
    t.integer "idcrutas",         limit: 4
    t.varchar "IdEmpresa",        limit: 50
  end

  add_index "Rutas", ["Vendedor"], name: "idxrutvend"
  add_index "Rutas", ["id_ayudante1"], name: "idxrutayud"

  create_table "RutasHistorico", id: false, force: :cascade do |t|
    t.integer "IdRutas",          limit: 4,   null: false
    t.varchar "Ruta",             limit: 50,  null: false
    t.boolean "Activa",                       null: false
    t.varchar "TipoRuta",         limit: 255, null: false
    t.integer "VenSinStock",      limit: 4,   null: false
    t.varchar "Oficina",          limit: 255, null: false
    t.varchar "Sector",           limit: 255, null: false
    t.integer "Vendedor",         limit: 4
    t.integer "Tipo",             limit: 4,   null: false
    t.integer "id_ayudante1",     limit: 4
    t.integer "id_ayudante2",     limit: 4
    t.boolean "VendedorAyudante",             null: false
    t.boolean "Foranea"
    t.integer "vehiculo",         limit: 4
    t.varchar "empresa",          limit: 50
    t.integer "idcrutas",         limit: 4
  end

  create_table "SalidasAlmacen", primary_key: "IDSalida", force: :cascade do |t|
    t.datetime "Fecha",                    null: false
    t.integer  "MotivoSalidaID", limit: 4, null: false
    t.integer  "Estatus",        limit: 1, null: false
  end

  create_table "SecRutas", primary_key: "Id", force: :cascade do |t|
    t.integer "Rutad",     limit: 4
    t.integer "Lunes",     limit: 4
    t.integer "Martes",    limit: 4
    t.integer "Miercoles", limit: 4
    t.integer "Jueves",    limit: 4
    t.integer "Viernes",   limit: 4
    t.integer "Sabado",    limit: 4
    t.integer "Domingo",   limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "SecRutas", ["Rutad"], name: "idxRuta"

  create_table "Stock", primary_key: "IdStock", force: :cascade do |t|
    t.varchar "Articulo",  limit: 50
    t.integer "Stock",     limit: 4
    t.integer "Ruta",      limit: 4
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "Stock", ["Articulo"], name: "idxstockart"
  add_index "Stock", ["Ruta"], name: "idxstockrut"

  create_table "StockHistorico", id: false, force: :cascade do |t|
    t.varchar "Articulo",  limit: 50
    t.integer "Stock",     limit: 4
    t.integer "RutaID",    limit: 4
    t.date    "Fecha"
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "StockHistorico", ["Articulo"], name: "idxArticulo"
  add_index "StockHistorico", ["Fecha"], name: "idxFecha"
  add_index "StockHistorico", ["Fecha"], name: "idxsthidfec"
  add_index "StockHistorico", ["RutaID"], name: "idxRuta"

  create_table "StockPedidos", force: :cascade do |t|
    t.string  "CodProd", limit: 50
    t.integer "Stock",   limit: 4
    t.integer "RutaId",  limit: 4
    t.integer "Pedido",  limit: 4
    t.integer "Status",  limit: 4
  end

  create_table "TD_Comision", primary_key: "ID_Comision", force: :cascade do |t|
    t.integer "ID_Detalle", limit: 4,  null: false
    t.integer "RangoIni",   limit: 4
    t.integer "RangoFin",   limit: 4
    t.float   "Angente"
    t.float   "Ayudante"
    t.integer "Tipo",       limit: 4
    t.varchar "IdEmpresa",  limit: 50
  end

  create_table "TH_Comision", primary_key: "ID_Comision", force: :cascade do |t|
    t.integer     "ID_Producto", limit: 4,          null: false
    t.char        "Status",      limit: 1
    t.varchar_max "Comentarios", limit: 2147483647
    t.varchar     "IdEmpresa",   limit: 50
  end

  create_table "TH_SecVisitas", primary_key: "Id", force: :cascade do |t|
    t.varchar "CodCli",    limit: 50, null: false
    t.integer "RutaId",    limit: 4,  null: false
    t.integer "Secuencia", limit: 4
    t.char    "Dia",       limit: 2
    t.date    "Fecha"
    t.varchar "IdEmpresa", limit: 50
  end

  add_index "TH_SecVisitas", ["RutaId", "Dia", "IdEmpresa"], name: "IX_TH_SecVisitas"

  create_table "TInvFis", primary_key: "IdRow", force: :cascade do |t|
    t.varchar  "Clave",       limit: 25,  null: false
    t.varchar  "Descripcion", limit: 250
    t.varchar  "UniMed",      limit: 5
    t.integer  "Stock_T",     limit: 4,   null: false
    t.integer  "Stock_R",     limit: 4,   null: false
    t.datetime "Fec_cad"
  end

  create_table "TMP_StockEnvases", id: false, force: :cascade do |t|
    t.varchar "Articulo", limit: 50
    t.integer "Stock",    limit: 4
    t.integer "Ruta",     limit: 4
  end

  create_table "T_Log", id: false, force: :cascade do |t|
    t.varchar     "IdEmpresa", limit: 50
    t.datetime    "Fecha"
    t.integer     "Ruta",      limit: 4
    t.varchar     "Modulo",    limit: 150
    t.varchar_max "Evento",    limit: 2147483647
    t.boolean     "Correcta"
    t.boolean     "EnProceso"
  end

  create_table "T_RepConCarga", id: false, force: :cascade do |t|
    t.varchar "IdEmpresa",    limit: 50
    t.varchar "Sector",       limit: 50
    t.varchar "Presentacion", limit: 50
    t.varchar "Familia",      limit: 50
    t.varchar "Marca",        limit: 50
    t.varchar "Unidades",     limit: 50
    t.varchar "IdProd",       limit: 50
    t.varchar "Producto",     limit: 50
    t.integer "1401",         limit: 4
    t.integer "1405",         limit: 4
    t.integer "1407",         limit: 4
    t.integer "1409",         limit: 4
    t.integer "1411",         limit: 4
    t.integer "1431",         limit: 4
    t.integer "1433",         limit: 4
    t.integer "1437",         limit: 4
    t.integer "1439",         limit: 4
    t.integer "1441",         limit: 4
    t.integer "1741",         limit: 4
    t.integer "1501",         limit: 4
    t.integer "1503",         limit: 4
    t.integer "1505",         limit: 4
    t.integer "1507",         limit: 4
    t.integer "1531",         limit: 4
    t.integer "1533",         limit: 4
    t.integer "1535",         limit: 4
    t.integer "1539",         limit: 4
    t.integer "1541",         limit: 4
    t.integer "1543",         limit: 4
    t.integer "1601",         limit: 4
    t.integer "1603",         limit: 4
    t.integer "1605",         limit: 4
    t.integer "1607",         limit: 4
    t.integer "1609",         limit: 4
    t.integer "1611",         limit: 4
    t.integer "1631",         limit: 4
    t.integer "1633",         limit: 4
    t.integer "1635",         limit: 4
    t.integer "1637",         limit: 4
    t.integer "1639",         limit: 4
    t.integer "1701",         limit: 4
    t.integer "1703",         limit: 4
    t.integer "1705",         limit: 4
    t.integer "1707",         limit: 4
    t.integer "1731",         limit: 4
    t.integer "1733",         limit: 4
    t.integer "1735",         limit: 4
    t.integer "1737",         limit: 4
    t.integer "1739",         limit: 4
    t.integer "1901",         limit: 4
    t.integer "1903",         limit: 4
    t.integer "1905",         limit: 4
    t.integer "1907",         limit: 4
    t.integer "1909",         limit: 4
    t.integer "1933",         limit: 4
    t.integer "1935",         limit: 4
    t.integer "1937",         limit: 4
    t.integer "1939",         limit: 4
    t.integer "1941",         limit: 4
    t.integer "1943",         limit: 4
    t.integer "1445",         limit: 4
    t.integer "1545",         limit: 4
    t.integer "1641",         limit: 4
    t.integer "1743",         limit: 4
    t.integer "1945",         limit: 4
    t.integer "2406",         limit: 4
    t.integer "2108",         limit: 4
  end

  create_table "T_RepConPed", id: false, force: :cascade do |t|
    t.varchar "IdEmpresa", limit: 50
    t.varchar "Ruta",      limit: 50
    t.integer "1",         limit: 4
    t.integer "10",        limit: 4
    t.integer "11",        limit: 4
    t.integer "12",        limit: 4
    t.integer "13",        limit: 4
    t.integer "14",        limit: 4
    t.integer "15",        limit: 4
    t.integer "16",        limit: 4
    t.integer "17",        limit: 4
    t.integer "18",        limit: 4
    t.integer "19",        limit: 4
    t.integer "2",         limit: 4
    t.integer "20",        limit: 4
    t.integer "21",        limit: 4
    t.integer "22",        limit: 4
    t.integer "23",        limit: 4
    t.integer "24",        limit: 4
    t.integer "25",        limit: 4
    t.integer "26",        limit: 4
    t.integer "27",        limit: 4
    t.integer "28",        limit: 4
    t.integer "29",        limit: 4
    t.integer "31",        limit: 4
    t.integer "32",        limit: 4
    t.integer "33",        limit: 4
    t.integer "34",        limit: 4
    t.integer "35",        limit: 4
    t.integer "36",        limit: 4
    t.integer "37",        limit: 4
    t.integer "38",        limit: 4
    t.integer "39",        limit: 4
    t.integer "4",         limit: 4
    t.integer "40",        limit: 4
    t.integer "42",        limit: 4
    t.integer "43",        limit: 4
    t.integer "44",        limit: 4
    t.integer "45",        limit: 4
    t.integer "46",        limit: 4
    t.integer "48",        limit: 4
    t.integer "49",        limit: 4
    t.integer "5",         limit: 4
    t.integer "52",        limit: 4
    t.integer "6",         limit: 4
    t.integer "7",         limit: 4
    t.integer "75",        limit: 4
    t.integer "77",        limit: 4
    t.integer "8",         limit: 4
  end

  create_table "T_RepConPedPz", id: false, force: :cascade do |t|
    t.varchar "IdEmpresa", limit: 50
    t.varchar "Ruta",      limit: 50
    t.integer "1",         limit: 4
    t.integer "10",        limit: 4
    t.integer "11",        limit: 4
    t.integer "12",        limit: 4
    t.integer "13",        limit: 4
    t.integer "14",        limit: 4
    t.integer "15",        limit: 4
    t.integer "16",        limit: 4
    t.integer "17",        limit: 4
    t.integer "18",        limit: 4
    t.integer "19",        limit: 4
    t.integer "2",         limit: 4
    t.integer "20",        limit: 4
    t.integer "21",        limit: 4
    t.integer "22",        limit: 4
    t.integer "23",        limit: 4
    t.integer "24",        limit: 4
    t.integer "25",        limit: 4
    t.integer "26",        limit: 4
    t.integer "27",        limit: 4
    t.integer "28",        limit: 4
    t.integer "29",        limit: 4
    t.integer "31",        limit: 4
    t.integer "32",        limit: 4
    t.integer "33",        limit: 4
    t.integer "34",        limit: 4
    t.integer "35",        limit: 4
    t.integer "36",        limit: 4
    t.integer "37",        limit: 4
    t.integer "38",        limit: 4
    t.integer "39",        limit: 4
    t.integer "4",         limit: 4
    t.integer "40",        limit: 4
    t.integer "42",        limit: 4
    t.integer "43",        limit: 4
    t.integer "44",        limit: 4
    t.integer "45",        limit: 4
    t.integer "46",        limit: 4
    t.integer "48",        limit: 4
    t.integer "49",        limit: 4
    t.integer "5",         limit: 4
    t.integer "52",        limit: 4
    t.integer "6",         limit: 4
    t.integer "7",         limit: 4
    t.integer "75",        limit: 4
    t.integer "77",        limit: 4
    t.integer "8",         limit: 4
  end

  create_table "T_RepFidelidad", id: false, force: :cascade do |t|
    t.varchar "Ruta",         limit: 50
    t.varchar "IdCliente",    limit: 50
    t.varchar "Cliente",      limit: 50
    t.varchar "Vendedor",     limit: 50
    t.varchar "Status",       limit: 50
    t.varchar "Jue 5/5/2016", limit: 1
  end

  create_table "T_TempLiquidacionesAux", id: false, force: :cascade do |t|
    t.varchar "RutaId",      limit: 50
    t.varchar "DiaO",        limit: 5
    t.varchar "Fecha",       limit: 20
    t.varchar "Clave",       limit: 15
    t.integer "VentaCajas",  limit: 4
    t.integer "VentaPiezas", limit: 4
    t.integer "PromoCajas",  limit: 4
    t.integer "PromoPiezas", limit: 4
    t.varchar "TipoObse",    limit: 20
    t.integer "CantObse",    limit: 4
  end

  create_table "Temporal", id: false, force: :cascade do |t|
    t.varchar "codigo",      limit: 50
    t.varchar "nombre",      limit: 255
    t.varchar "nombrecorto", limit: 255
  end

  create_table "TmpCoordCtes", id: false, force: :cascade do |t|
    t.varchar  "Codigo",    limit: 50
    t.float    "Latitude"
    t.integer  "Latitud",   limit: 4
    t.float    "Longitude"
    t.integer  "Longitud",  limit: 4
    t.datetime "Fecha"
  end

  create_table "TmpCteLimCred", id: false, force: :cascade do |t|
    t.varchar "IdCli",         limit: 50
    t.money   "LimiteCredito",            precision: 19, scale: 4
  end

  create_table "Tmp_Stock", id: false, force: :cascade do |t|
    t.varchar "Articulo", limit: 50
    t.integer "Stock",    limit: 4
    t.integer "Ruta",     limit: 4
  end

  create_table "Usuarios", primary_key: "IdUsuario", force: :cascade do |t|
    t.varchar_max "Nombre",                 limit: 2147483647
    t.integer     "IdPerfil",               limit: 4
    t.varchar     "empresa_id",             limit: 50
    t.string      "email",                  limit: 4000,       default: "", null: false
    t.string      "encrypted_password",     limit: 4000,       default: "", null: false
    t.string      "usuario",                limit: 4000,       default: "", null: false
    t.string      "reset_password_token",   limit: 4000
    t.datetime    "reset_password_sent_at"
    t.datetime    "remember_created_at"
    t.integer     "sign_in_count",          limit: 4,          default: 0,  null: false
    t.datetime    "current_sign_in_at"
    t.datetime    "last_sign_in_at"
    t.string      "current_sign_in_ip",     limit: 4000
    t.string      "last_sign_in_ip",        limit: 4000
    t.integer     "empresamadre_id",        limit: 4
  end

  add_index "Usuarios", ["email"], name: "index_usuarios_on_email", unique: true
  add_index "Usuarios", ["empresamadre_id"], name: "index_usuarios_on_empresamadre_id"
  add_index "Usuarios", ["usuario"], name: "index_usuarios_on_usuario", unique: true

  create_table "Vehiculos", primary_key: "IdVehiculos", force: :cascade do |t|
    t.varchar_max "Clave",           limit: 2147483647
    t.varchar_max "Modelo",          limit: 2147483647
    t.varchar_max "Placas",          limit: 2147483647
    t.varchar_max "Marcas",          limit: 2147483647
    t.varchar_max "Descripcion",     limit: 2147483647
    t.text        "Status",          limit: 2147483647
    t.varchar_max "NumeroEco",       limit: 2147483647
    t.boolean     "Asignado"
    t.varchar_max "Poliza",          limit: 2147483647
    t.varchar     "TelSeguro",       limit: 50
    t.datetime    "MesVerifica"
    t.varchar     "Kilometraje",     limit: 50
    t.varchar     "KilometrajeSem",  limit: 50
    t.varchar_max "Aseguradora",     limit: 2147483647
    t.datetime    "FechaVencSeguro"
    t.datetime    "FechaUltVerif"
    t.varchar     "IdEmpresa",       limit: 50
    t.string      "Modelo_year",     limit: 4
  end

  create_table "Vendedores", primary_key: "IdVendedor", force: :cascade do |t|
    t.varchar  "Nombre",       limit: 255,  null: false
    t.varchar  "IdVehiculo",   limit: 255
    t.boolean  "Status",                    null: false
    t.varchar  "Direccion",    limit: 255,  null: false
    t.varchar  "Telefono",     limit: 50,   null: false
    t.varchar  "PdaPw",        limit: 50,   null: false
    t.varchar  "NumLicencia",  limit: 255,  null: false
    t.varchar  "MetaDiaria",   limit: 50,   null: false
    t.varchar  "MetaMes",      limit: 50,   null: false
    t.varchar  "Movil",        limit: 50,   null: false
    t.datetime "VenceLic",                  null: false
    t.varchar  "Clave",        limit: 255,  null: false
    t.integer  "ID_Ayudante1", limit: 4
    t.integer  "ID_Ayudante2", limit: 4
    t.varchar  "IdEmpresa",    limit: 50
    t.string   "Tipo",         limit: 4000
  end

  add_index "Vendedores", ["Clave"], name: "idxvendedores", unique: true

  create_table "Venta", primary_key: "Id", force: :cascade do |t|
    t.integer  "RutaId",       limit: 4
    t.integer  "VendedorId",   limit: 4
    t.text     "CodCliente",   limit: 2147483647
    t.integer  "Documento",    limit: 4
    t.datetime "Fecha"
    t.string   "TipoVta",      limit: 50
    t.integer  "DiasCred",     limit: 4
    t.decimal  "CreditoDispo",                    precision: 18, scale: 2
    t.decimal  "Saldo",                           precision: 18, scale: 2
    t.date     "Fvence"
    t.money    "SubTotal",                        precision: 19, scale: 4
    t.money    "IVA",                             precision: 19, scale: 4
    t.money    "IEPS",                            precision: 19, scale: 4
    t.money    "TOTAL",                           precision: 19, scale: 4
    t.text     "EnLetra",      limit: 2147483647
    t.integer  "Items",        limit: 4
    t.integer  "FormaPag",     limit: 4
    t.string   "DocSalida",    limit: 50
    t.integer  "DiaO",         limit: 4
    t.boolean  "Cancelada"
    t.decimal  "Kg",                              precision: 18, scale: 2
    t.integer  "ID_Ayudante1", limit: 4
    t.integer  "ID_Ayudante2", limit: 4
    t.integer  "VenAyunate",   limit: 4
    t.varchar  "IdEmpresa",    limit: 50
  end

  add_index "Venta", ["Fecha"], name: "idxvenfec"
  add_index "Venta", ["RutaId", "Documento"], name: "IX_Venta"
  add_index "Venta", ["TipoVta"], name: "IX_Venta_TipoVta"

  create_table "Visitas", primary_key: "Id", force: :cascade do |t|
    t.string   "CodCliente",  limit: 50,                          null: false
    t.integer  "DiaO",        limit: 4,                           null: false
    t.datetime "FechaI"
    t.boolean  "EnSecuencia"
    t.datetime "FechaF"
    t.decimal  "Venta",                  precision: 18, scale: 0
    t.decimal  "Pedido",                 precision: 18, scale: 0
    t.decimal  "Devolucion",             precision: 18, scale: 0
    t.decimal  "Cobranza",               precision: 18, scale: 0
    t.decimal  "IdCe",                   precision: 18, scale: 0
    t.integer  "ruta",        limit: 4
    t.varchar  "IdEmpresa",   limit: 50
  end

  add_index "Visitas", ["CodCliente", "DiaO", "ruta"], name: "IX_Visitas"
  add_index "Visitas", ["FechaF"], name: "idxvisfecf"
  add_index "Visitas", ["FechaI"], name: "idxvisfec"

  create_table "empresasmadre", force: :cascade do |t|
    t.string   "Empresa",         limit: 4000
    t.string   "Telefono",        limit: 4000
    t.string   "Contacto",        limit: 4000
    t.string   "Email",           limit: 4000
    t.string   "RFC",             limit: 4000
    t.string   "Direccion",       limit: 4000
    t.string   "NoExterior",      limit: 4000
    t.string   "NoInterior",      limit: 4000
    t.string   "CP",              limit: 4000
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "NombreComercial", limit: 4000
  end

  create_table "hotels", force: :cascade do |t|
    t.string   "name",       limit: 4000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "room_categories", force: :cascade do |t|
    t.string   "name",       limit: 4000
    t.integer  "hotel_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "room_categories", ["hotel_id"], name: "index_room_categories_on_hotel_id"

  create_table "segmentos", primary_key: "idsegmento", force: :cascade do |t|
    t.varchar "segmento", limit: 75, null: false
  end

  add_foreign_key "Activos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Activos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Ayudantes", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Ayudantes_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "BitacoraCuotas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_BitacoraCuotas_Rutas"
  add_foreign_key "BitacoraTiempos", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_bitties_Diasrut"
  add_foreign_key "BitacoraTiempos", "DiasO", column: "RutaId", primary_key: "RutaId", name: "FK_bitties_Diasrut"
  add_foreign_key "BitacoraTiempos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_BitacoraTiempos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CTiket", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_CTiket_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cancelaciones", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Cancelaciones_Rutas"
  add_foreign_key "CargaRuta", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_CargaRuta_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "CargaRuta", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_CargaRuta_Rutas"
  add_foreign_key "ClasClientes", "segmentos", column: "idsegmento", primary_key: "idsegmento", name: "FK__ClasClien__idseg__7C3A67EB"
  add_foreign_key "Clientes", "ClasClientes", column: "idclasc", primary_key: "IdClasC", name: "FK__Clientes__idclas__251C81ED"
  add_foreign_key "Clientes", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Clientes_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Clientes", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Clientes__IdEmpr__2610A626"
  add_foreign_key "Clientes", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Clientes__IdEmpr__68687968"
  add_foreign_key "Clientes", "segmentos", column: "idclasc", primary_key: "idsegmento", name: "FK__Clientes__idclas__7B4643B2"
  add_foreign_key "Cobranza", "Clientes", column: "Cliente", primary_key: "IdCli", name: "FK_cob_cli"
  add_foreign_key "Cobranza", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Cobranza_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cobranza", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Cobranza_Rutas"
  add_foreign_key "CodesOp", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_CodesOp_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Comisiones", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Comisiones_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ConfigRutasP", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ConfigRutasP_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ConfigRutasP", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_ConfigRutasP_Rutas"
  add_foreign_key "Configuracion", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Configuracion_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ConfiguracionGral", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ConfiguracionGral_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ContadorNC", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ContadorNC_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cuotas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Cuotas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Cuotas", "Productos", column: "Producto", primary_key: "Clave", name: "FK_Cuotas_Productos"
  add_foreign_key "DetalleCob", "Cobranza", column: "IdCobranza", name: "FK_detalle_cob"
  add_foreign_key "DetalleCob", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleCob_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleCob", "FormasPag", column: "FormaP", primary_key: "IdFpag", name: "FK_DetalleCob_FormasPag", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleDevol", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleDevol_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleDevol", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_DetalleDevol_Rutas"
  add_foreign_key "DetalleLD", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleLD_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleLD", "ListaD", column: "ListaId", name: "FK_detalleld_list"
  add_foreign_key "DetalleLD", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_DetalleLD_Productos"
  add_foreign_key "DetalleLP", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleLP_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleLP", "ListaP", column: "ListaId", name: "FK_detallelp_list"
  add_foreign_key "DetalleLP", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_DetalleLP_Productos"
  add_foreign_key "DetalleLProMaster", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleLProMaster_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetallePedidos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetallePedidos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetallePromo", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetallePromo_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetallePromo", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_DetallePromo_Productos"
  add_foreign_key "DetalleSalidas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleSalidas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleSalidas", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_DetalleSalidas_Productos"
  add_foreign_key "DetalleVet", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DetalleVet_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DetalleVet", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_DetalleVet_Rutas"
  add_foreign_key "DevEnvases", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_DevEnvases_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DevEnvases", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_DevEnvases_Rutas"
  add_foreign_key "Devoluciones", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_dev_DiasO"
  add_foreign_key "Devoluciones", "DiasO", column: "Ruta", primary_key: "RutaId", name: "FK_dev_DiasO"
  add_foreign_key "Devoluciones", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Devoluciones_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "DiasO", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_DiasO_Rutas"
  add_foreign_key "DiasOperativos", "DiasO", column: "Dia", primary_key: "DiaO", name: "FK_diop_DiasO"
  add_foreign_key "DiasOperativos", "DiasO", column: "RutaId", primary_key: "RutaId", name: "FK_diop_DiasO"
  add_foreign_key "Empresas", "empresasmadre"
  add_foreign_key "Encuestas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Encuestas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Liquidacion", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Liquidacion_Rutas"
  add_foreign_key "ListaD", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ListaD_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ListaP", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ListaP_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ListaPromo", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ListaPromo_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ListaPromoMaster", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ListaPromoMaster_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Medidores", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_Medidores_Rutas"
  add_foreign_key "Medidores", "DiasO", column: "IdRuta", primary_key: "RutaId", name: "FK_Medidores_Rutas"
  add_foreign_key "Medidores", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Medidores_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Mensajes", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Mensajes_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Mermas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Mermas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Mermas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Mermas_Rutas"
  add_foreign_key "MvtosInv", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_MvtosInv_Productos"
  add_foreign_key "MvtosInv", "Rutas", column: "RutaD", primary_key: "IdRutas", name: "FK_MvtosInv_Rutas1"
  add_foreign_key "Noventas", "Clientes", column: "Cliente", primary_key: "IdCli", name: "FK_novebta_cli"
  add_foreign_key "Noventas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Noventas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Noventas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Noventas_Rutas"
  add_foreign_key "Noventas", "Vendedores", column: "VendedorId", primary_key: "IdVendedor", name: "FK_noventa_Vendedores"
  add_foreign_key "Opc_Enc", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Opc_Enc_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Opc_Enc", "Encuestas", column: "Clave_Enc", primary_key: "Clave_Enc", name: "FK_opce_encues"
  add_foreign_key "OperacionD", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_opd_DiasO"
  add_foreign_key "OperacionD", "DiasO", column: "Ruta", primary_key: "RutaId", name: "FK_opd_DiasO"
  add_foreign_key "PContado", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_pcontado_DiasO"
  add_foreign_key "PContado", "DiasO", column: "RutaId", primary_key: "RutaId", name: "FK_pcontado_DiasO"
  add_foreign_key "PContado", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_PContado_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PRegalado", "Clientes", column: "Cliente", primary_key: "IdCli", name: "FK_prega_cli"
  add_foreign_key "PRegalado", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_PRegalado_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PVendidos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_PVendidos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PVendidos", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_PVendidos_Rutas"
  add_foreign_key "Pagos", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_pagos_DiasO"
  add_foreign_key "Pagos", "DiasO", column: "RutaId", primary_key: "RutaId", name: "FK_pagos_DiasO"
  add_foreign_key "PedDiaSig", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_PedDiaSig_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PedDiaSig", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_pediasig_Productos"
  add_foreign_key "PedDiaSig", "Rutas", column: "IdRuta", primary_key: "IdRutas", name: "FK_PedDiaSig_Rutas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PedDiaSigPzs", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_PedDiaSigPzs_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "PedDiaSigPzs", "Rutas", column: "IdRuta", primary_key: "IdRutas", name: "FK_PedDiaSigPzs_Rutas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Pedidos", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_pedidos_DiasO"
  add_foreign_key "Pedidos", "DiasO", column: "Ruta", primary_key: "RutaId", name: "FK_pedidos_DiasO"
  add_foreign_key "Pedidos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Pedidos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Preg_Enc", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Preg_Enc_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Preg_Enc", "Encuestas", column: "Clave_Enc", primary_key: "Clave_Enc", name: "FK_preg_encu"
  add_foreign_key "ProductoEnvase", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ProductoEnvase_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProductoEnvase", "Productos", column: "Producto", primary_key: "Clave", name: "FK_ProductoEnvase_Productos"
  add_foreign_key "ProductoNegado", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ProductoNegado_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProductoNegado", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_ProductoNegado_Rutas"
  add_foreign_key "ProductoPaseado", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ProductoPaseado_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProductoPaseado", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_ProductoPaseado_Rutas"
  add_foreign_key "Productos", "ClasProductos", column: "idclasp", primary_key: "IdClasP", name: "FK__Productos__idcla__695C9DA1"
  add_foreign_key "Productos", "ClasProductos", column: "idclasp", primary_key: "IdClasP", name: "FK__Productos__idcla__725BF7F6"
  add_foreign_key "Productos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Productos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProductosXPzas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ProductosXPzas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ProductosXPzas", "Productos", column: "Producto", primary_key: "Clave", name: "FK_ProductosXPzas_Productos"
  add_foreign_key "Recarga", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Recarga_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Recarga", "Rutas", column: "IdRuta", primary_key: "IdRutas", name: "FK_Recarga_Rutas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelActivos", "Activos", column: "Activo", primary_key: "IdActivos", name: "FK_RelActivos_Activos"
  add_foreign_key "RelActivos", "Clientes", column: "Cliente", primary_key: "IdCli", name: "FK_RelActivos_Clientes"
  add_foreign_key "RelActivos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelActivos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelCliClas", "Clientes", column: "IdCliente", primary_key: "IdCli", name: "FK_RelCliClas_Clientes"
  add_foreign_key "RelCliClas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelCliClas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelCliLis", "Clientes", column: "CodCliente", primary_key: "IdCli", name: "FK_RelCliLis_Clientes"
  add_foreign_key "RelCliLis", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelCliLis_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelClirutas", "Clientes", column: "IdCliente", primary_key: "IdCli", name: "FK_RelClirutas_Clientes"
  add_foreign_key "RelClirutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelClirutas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelClirutas", "Rutas", column: "IdRuta", primary_key: "IdRutas", name: "FK_RelClirutas_Rutas"
  add_foreign_key "RelCuoVend", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelCuoVend_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelCuoVend", "Vendedores", column: "VendeId", primary_key: "IdVendedor", name: "FK_RelCuoVend_Vendedores"
  add_foreign_key "RelDayCli", "Clientes", column: "CodCli", primary_key: "IdCli", name: "FK_RelDayCli_Clientes"
  add_foreign_key "RelDayCli", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelDayCli_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelMens", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelMens_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelMens", "Rutas", column: "CodRuta", primary_key: "IdRutas", name: "FK_RelMens_Rutas"
  add_foreign_key "RelOperaciones", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelOperaciones_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelOperaciones", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_RelOperaciones_Rutas"
  add_foreign_key "RelProClas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelProClas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelProClas", "Productos", column: "ProductoId", primary_key: "Clave", name: "FK_RelProClas_Productos"
  add_foreign_key "RelRuClas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_RelRuClas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "RelRuClas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_RelRuClas_Rutas"
  add_foreign_key "Rel_EncRut", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Rel_EncRut_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Rel_EncRut", "Rutas", column: "Id_Ruta", primary_key: "IdRutas", name: "FK_Rel_EncRut_Rutas"
  add_foreign_key "ResCuotas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_ResCuotas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ResCuotas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_ResCuotas_Rutas"
  add_foreign_key "Resp_Enc", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Resp_Enc_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Resp_Enc", "Rutas", column: "IdRuta", primary_key: "IdRutas", name: "FK_Resp_Enc_Rutas"
  add_foreign_key "Rutas", "ClasRutas", column: "idcrutas", primary_key: "IdCRutas", name: "FK__Rutas__idcrutas__14B10FFA"
  add_foreign_key "Rutas", "ClasRutas", column: "idcrutas", primary_key: "IdCRutas", name: "FK__Rutas__idcrutas__6A50C1DA"
  add_foreign_key "Rutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Rutas_Empresas"
  add_foreign_key "Rutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Rutas__IdEmpresa__15A53433"
  add_foreign_key "Rutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Rutas__IdEmpresa__1699586C"
  add_foreign_key "Rutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Rutas__IdEmpresa__6B44E613"
  add_foreign_key "Rutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK__Rutas__IdEmpresa__6C390A4C"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__178D7CA5"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__1881A0DE"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__1975C517"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__6D2D2E85"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__6E2152BE"
  add_foreign_key "Rutas", "Vehiculos", column: "vehiculo", primary_key: "IdVehiculos", name: "FK__Rutas__vehiculo__6F1576F7"
  add_foreign_key "Rutas", "Vendedores", column: "Vendedor", primary_key: "IdVendedor", name: "FK_Rutas_Vendedores"
  add_foreign_key "SecRutas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_SecRutas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "SecRutas", "Rutas", column: "Rutad", primary_key: "IdRutas", name: "FK_SecRutas_Rutas"
  add_foreign_key "Stock", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Stock_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Stock", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_stock_Productos"
  add_foreign_key "Stock", "Rutas", column: "Ruta", primary_key: "IdRutas", name: "FK_Stock_Rutas"
  add_foreign_key "StockHistorico", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_StockHistorico_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "StockHistorico", "Productos", column: "Articulo", primary_key: "Clave", name: "FK_StockHistorico_Productos"
  add_foreign_key "StockPedidos", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_StockPedidos_Rutas"
  add_foreign_key "TD_Comision", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_TD_Comision_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "TD_Comision", "TH_Comision", column: "ID_Comision", primary_key: "ID_Comision", name: "FK_TD_Comision_TH_Comision"
  add_foreign_key "TH_Comision", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_TH_Comision_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "TH_SecVisitas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_TH_SecVisitas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "TH_SecVisitas", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_TH_SecVisitas_Rutas"
  add_foreign_key "Usuarios", "Empresas", column: "empresa_id", primary_key: "IdEmpresa", name: "FK_Usuario_empresa"
  add_foreign_key "Usuarios", "empresasmadre"
  add_foreign_key "Vehiculos", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Vehiculos_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Vendedores", "Ayudantes", column: "ID_Ayudante1", primary_key: "id_ayudante", name: "FK_Vendedores_Ayudantes"
  add_foreign_key "Vendedores", "Ayudantes", column: "ID_Ayudante2", primary_key: "id_ayudante", name: "FK_Vendedores_Ayudantes1"
  add_foreign_key "Vendedores", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Vendedores_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Venta", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Venta_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "Venta", "FormasPag", column: "FormaPag", primary_key: "IdFpag", name: "FK_ven_fpag"
  add_foreign_key "Venta", "Rutas", column: "RutaId", primary_key: "IdRutas", name: "FK_Venta_Rutas"
  add_foreign_key "Venta", "Vendedores", column: "VendedorId", primary_key: "IdVendedor", name: "FK_Venta_Vendedores"
  add_foreign_key "Visitas", "DiasO", column: "DiaO", primary_key: "DiaO", name: "FK_visitas_DiasO"
  add_foreign_key "Visitas", "DiasO", column: "ruta", primary_key: "RutaId", name: "FK_visitas_DiasO"
  add_foreign_key "Visitas", "Empresas", column: "IdEmpresa", primary_key: "IdEmpresa", name: "FK_Visitas_Empresas", on_update: :cascade, on_delete: :cascade
  add_foreign_key "room_categories", "hotels"
end
