class Devenvase < ActiveRecord::Base
  self.primary_key = 'ID'



  def self.busqueda_general(params)
   query = select('[devenvases].CodCli,[clientes].Nombre,[clientes].NombreCorto,[devenvases].Articulo,[productos].Producto')
              .joins("inner join clientes on devenvases.CodCli=clientes.IdCli inner join productos on devenvases.Articulo=productos.Clave")
                      .where("(devenvases.Tipo = 'Venta')AND(devenvases.Ruta = :rutaId or :rutaId = '') AND (devenvases.diao = :diao or :diao = '')",{rutaId: params[:search], diao: params[:diao]})
  end



end
