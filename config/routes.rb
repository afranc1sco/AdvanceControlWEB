Rails.application.routes.draw do


  resources :catmarcas
  resources :catunidadmedida
  resources :catgrupos
  resources :catbancos
  get '/bancos_inactivos', to: 'catbancos#inactivos', as: 'catbancos_inactivos'

  resources :cp


  get 'ventas/index', as: 'ventas1'
  get '/busqueda_clientes_captados', to: 'ventas#busqueda_clientes_captados', as: 'busqueda_clientes_captados'
  get '/busqueda_general_graficos', to: 'ventas#busqueda_general_graficos', as: 'busqueda_general_graficos'

  get 'ventas/index2', as: 'ventas2'
  get 'ventas/index3', as: 'ventas3'
  get 'ventas/index4', as: 'ventas4'


  resources :detallecob
  #get '/CuentasxCobrar/:id', to: 'detallecob#cuentasxcobrar', as: 'cuentasxcobrar'
  #post '/CuentasxCobrar/datos', to: 'detallecob#obtener_ruta', as: 'cuentasxcobrar_obtener_ruta' #as es el nombre con el path que se le colocara

  resources :stock
  get '/generar_stock/:id', to: 'stock#generar_stock', as: 'generar_stock'
  post '/generar_stock/datos', to: 'stock#obtener_ruta', as: 'stock_obtener_ruta' #as es el nombre con el path que se le colocara

  resources :relactivos
  get '/activos_cliente/:id', to: 'relactivos#activos_cliente', as: 'activos_cliente'

  resources :activos do
     get 'activos_check_cb', :on => :collection
  end

  get '/activos_inactivos', to: 'activos#inactivos', as: 'activos_inactivos'


  resources :reldaycli
  get '/generar_ruta/:id/:id2', to: 'reldaycli#generar_ruta', as: 'generar_ruta'

  post '/reldaycli/datos', to: 'reldaycli#obtener_ruta_y_dia', as: 'ryd' #as es el nombre con el path que se le colocara

  resources :secrutas
  resources :relproclas
  resources :clasproductos
  resources :relcliclas
  #promociones
  resources :detallelpromaster
  get '/detallepromocion/:id', to: 'detallelpromaster#index', as: 'detallelpromasterid'
  resources :listapromomaster
  resources :clasclientes
  resources :listapromo do
    resources :detallepromo
    get 'promociones_check', :on => :collection
  end
  get '/promociones_inactivas', to: 'listapromo#inactivos', as: 'listapromo_inactivos'


  resources :room_categories
  resources :hotels
  resources :relruclas
  resources :clasrutas
  resources :continuidad
  resources :configrutasp

  resources :rutas do
    collection { post :import}#importar datos excel
    get 'rutas_check', :on => :collection
  end
  get '/rutas_inactivas', to: 'rutas#inactivos', as: 'rutas_inactivos'

  resources :relclirutas
  get '/ruta/:id/clientes', to: 'relclirutas#ruta_clientes', as: 'ruta_clientes'


  resources :relmens
  resources :perfiles
  resources :mvodev do
    get 'mvodev_check', :on => :collection

  end
  get '/mvodevoluciones_inactivos', to: 'mvodev#inactivos', as: 'mvodev_inactivos'

  resources :encuestas
  get '/encuestas_inactivas', to: 'encuestas#inactivos', as: 'encuestas_inactivos'



  resources :relmens

  resources :mensajes do
    get 'mensajes_check', :on => :collection
  end
  get 'mensajes/_inactivos', to: 'mensajes#inactivos', as: 'mensajes_inactivos'

  resources :cuotas
  get '/cuotas_inactivos', to: 'cuotas#inactivos', as: 'cuotas_inactivos'

  resources :td_comision
  resources :detallelp
  resources :detallelp
  resources :listap
  resources :relclilis
  resources :detalleld
  resources :th_comision
  get '/th_comision_inactivos', to: 'th_comision#inactivos', as: 'th_comision_inactivos'
  resources :listad

  resources :mvomerma do
    get 'mvomerma_check', :on => :collection
  end
  get '/mvomerma_inactivos', to: 'mvomerma#inactivos', as: 'mvomerma_inactivos'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :motivosnoventa do
    get 'motivosnoventa_check', :on => :collection

  end
  get '/motivosnoventa_inactivos', to: 'motivosnoventa#inactivos', as: 'motivosnoventa_inactivos'

  resources :formaspag do
    get 'formaspag_check', :on => :collection
  end
  get '/formaspago_inactivos', to: 'formaspag#inactivos', as: 'formaspag_inactivos'

  resources :productosxpzas

  resources :productoenvase
  get '/Productos/:id/envase', to: 'productoenvase#index', as: 'producto_envase'

  resources :detalleld

#Lista de descuento
  get '/listald/:id/productos', to: 'detalleld#index', as: 'producto_detalle'
  get '/listald/:id/clientes', to: 'relclilis#index', as: 'cliente_detalle'

#Lista de precios
  get '/listap/:id/productos', to: 'detallelp#index', as: 'productos_listap'
  get '/listap/:id/clientes', to: 'relclilis#indexlistap', as: 'cliente_listap'

#Agregando Clientes al grupo de promociones
  get '/Promociones/:id/clientes', to: 'relclilis#clientes_promociones', as: 'clientes_promociones'

#detalle de la Comision
  get '/comision/:id/detalle', to: 'td_comision#index', as: 'comision_detalle'

  post "/usuario_nuevo", to: 'usuarios#create', as:'usuario_nuevo'

#Mensajes
  get '/Mensajes/:id/productos', to: 'relmens#index', as: 'mensaje_productos'
  get '/Mensajes/:id/clientes', to: 'relmens#clientes', as: 'mensaje_clientes'
  get '/Mensajes/:id/rutas', to: 'relmens#rutas', as: 'mensaje_rutas'



  devise_for :usuarios, controllers: {
    registrations: "usuarios/registrations",
    sessions: "usuarios/sessions",
    passwords: "usuarios/passwords"}
    resources :usuarios do
      get 'usuarios_check', :on => :collection
      get 'usuarios_check2', :on => :collection
    end
    devise_scope :usuario do
      get 'usuarios/sessions/busqueda_sucursales', as: 'busqueda_sucursales'#Actualiza el selectbox de la sucursal dependindo de la empresa en el login
    end
    get '/usuarios_inactivos', to: 'usuarios#inactivos', as: 'usuarios_inactivos'
    get '/usuario_sucursales', to: 'usuarios#usuario_sucursales', as: 'usuario_sucursales'

  resources :productos do
    collection { post :import}#importar datos excel
    get 'productos_check', :on => :collection
  end

  get '/productos_inactivos', to: 'productos#inactivos', as: 'productos_inactivos'
  get '/busqueda_cp', to: 'clientes#busqueda_cp', as: 'busqueda_cp'

  resources :clientes do
    collection { post :import}#importar datos excel
    get 'clientes_check', :on => :collection
  end

  get '/clientes_inactivos', to: 'clientes#inactivos', as: 'clientes_inactivos'

  resources :ayudantes do
    collection { post :import}#importar datos excel
  end

  resources :empresas do
    collection { post :import}#importar datos excel
  end
  get '/empresa/:id/sucursales', to: 'empresas#sucursales', as: 'sucursales'
  #Comprobar existencia de empresa
  get '/empresa/empresas_check', to: 'empresas#empresas_check', as: 'empresas_check_empresas'

  get '/empresas_inactivas', to: 'empresas#inactivos', as: 'empresasempresas_inactivos'

  resources :empresasmadre do
    collection { post :import}#importar datos excel
    get 'empresasmadre_check', :on => :collection

  end
  get '/empresasmadre_inactivas', to: 'empresasmadre#inactivos', as: 'empresasmadre_inactivos'


  resources :vehiculos do
    collection { post :import}#importar datos excel
    get 'vehiculos_check', :on => :collection
  end
  get '/vehiculos_inactivos', to: 'vehiculos#inactivos', as: 'vehiculos_inactivos'

  resources :vendedores do
    collection { post :import}#importar datos excel
    get 'vendedores_check', :on => :collection
  end

  get '/vendedores_inactivos', to: 'vendedores#inactivos', as: 'vendedores_inactivos'

  get 'welcome/index'

  #REPORTES
  get 'pregalado/producto_obsequio'
  get '/busqueda_producto_obsequio', to: 'pregalado#busqueda_producto_obsequio'

  get 'pregalado/index'
  get '/busqueda_producto_promocion', to: 'pregalado#busqueda', as: 'busqueda'

  get 'devoluciones/index'
  get '/busqueda_devoluciones', to: 'devoluciones#busqueda_devoluciones', as: 'busqueda_devoluciones'

  get '/busqueda_ventas', to: 'venta#busqueda_ventas'
  get 'venta/venta'
  get 'reportesventas/Visita_sin_venta'


  resources :cobranza
  get '/ctasxcobrar/:id', to: 'cobranza#ctasxcobrar', as: 'ctasxcobrar'
  post '/ctasxcobrar/datos', to: 'cobranza#obtener_ruta', as: 'cobranza_obtener_ruta' #as es el nombre con el path que se le colocara

  get '/bitacora_cobranza/:id', to: 'cobranza#cobranza_bitacora', as: 'cobranza_bitacora'
  get '/bitacora_cobranza', to: 'cobranza#index_cobranza_bitacora', as: 'index_cobranza_bitacora'

  get 'bit_cobranza/busqueda_cobranza', to: 'cobranza#busqueda_cobranza'

  get 'inventario/producto_negado'
  get '/busqueda_producto_negado', to: 'inventario#busqueda_producto_negado'

  get 'reportes_ruta/recargas'
  get '/busqueda_recarga', to: 'reportes_ruta#busqueda_recarga'

  get 'reportes_ruta/envases'
  get '/busqueda_envase', to: 'reportes_ruta#busqueda_envase'
  get 'reportes_ruta/update_dia', as: 'update_dia'#Actualiza el selectbox de dia operativo conconrde a la ruta

  get 'reportes_ruta/consumos'
  get '/busqueda_consumo', to: 'reportes_ruta#busqueda_consumo'


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'ventas#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
