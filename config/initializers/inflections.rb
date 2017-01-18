# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'vent', 'venta'
  inflect.irregular 'vendedor', 'vendedores'
  inflect.irregular 'vehiculo', 'vehiculos'
  inflect.irregular 'empresa', 'empresas'
  inflect.irregular 'empresamadre', 'empresasmadre'
  inflect.irregular 'ayudante', 'ayudantes'
  inflect.irregular 'cliente', 'clientes'
  inflect.irregular 'clascliente', 'clasclientes'
  inflect.irregular 'relclicla', 'relcliclas'
  inflect.irregular 'producto', 'productos'
  inflect.irregular 'productosxpza', 'productosxpzas'
  inflect.irregular 'productoenvas', 'productoenvase'
  inflect.irregular 'clasproducto', 'clasproductos'
  inflect.irregular 'relprocla', 'relproclas'
  inflect.irregular 'usuario', 'usuarios'
  inflect.irregular 'formapag', 'formaspag'
  inflect.irregular 'motivonoventa', 'motivosnoventa'
  inflect.irregular 'mvmerma', 'mvomerma'
#lista de descuentos
  inflect.irregular 'slista', 'listad'
  inflect.irregular 'detalle', 'detalleld'
#lista de precios
  inflect.irregular 'list', 'listap'
  inflect.irregular 'deta', 'detallelp'
#clientes lista de precios y de descuentos (es una sola tabla)
  inflect.irregular 'relclili', 'relclilis'
#
  inflect.irregular 'comision', 'th_comision'
  inflect.irregular 'tdcomision', 'td_comision'
  inflect.irregular 'cuota', 'cuotas'
  inflect.irregular 'mensaje', 'mensajes'
  inflect.irregular 'encuesta', 'encuestas'
  inflect.irregular 'mvodevolucion', 'mvodev'
  inflect.irregular 'perfil', 'perfiles'
  inflect.irregular 'relmen', 'relmens'
  inflect.irregular 'ruta', 'rutas'
  inflect.irregular 'configruta', 'configrutasp'
  inflect.irregular 'continuid', 'continuidad'
  inflect.irregular 'clasruta', 'clasrutas'
  inflect.irregular 'relrucla', 'relruclas'
  inflect.irregular 'relcliruta', 'relclirutas'
  inflect.irregular 'secruta', 'secrutas'
  inflect.irregular 'reldayc', 'reldaycli'
  inflect.irregular 'activo', 'activos'
  inflect.irregular 'relactivo', 'relactivos'
  #promociones
  inflect.irregular 'listaprom', 'listapromo'
  inflect.irregular 'detalleprom', 'detallepromo'
  inflect.irregular 'listapromomast', 'listapromomaster'
  inflect.irregular 'detallelpromast', 'detallelpromaster'
  #procesos
  inflect.irregular 'stoc', 'stock'
  inflect.irregular 'cobran', 'cobranza'
  inflect.irregular 'detalleco', 'detallecob'
  inflect.irregular 'codigopostal', 'cp'
  #Reporte de ventas
  inflect.irregular 'detalleve', 'detallevet'
  #Reporte de Devoluciones
  inflect.irregular 'devol', 'devoluciones'
  inflect.irregular 'detalledevo', 'detalledevol'
  #Reporte producto promociones
  inflect.irregular 'pregalad', 'pregalado'
  #Reporte Noventas
  inflect.irregular 'noventasingular', 'noventas'
  #Reporte
  inflect.irregular 'bitacoratiempo', 'bitacoratiempos'
  inflect.irregular 'productoneg', 'productonegado'
  inflect.irregular 'diaop', 'diaso'
  inflect.irregular 'recarg', 'recarga'
  inflect.irregular 'devenvase', 'devenvases'
  inflect.irregular 'medidor', 'medidores'
  inflect.irregular 'catbanco', 'catbancos'
  inflect.irregular 'catgrupo', 'catgrupos'
  inflect.irregular 'catmarca', 'catmarcas'
  inflect.irregular 'catunidadmed', 'catunidadmedida'




end
