class Noventasingular < ActiveRecord::Base
  self.primary_key = "Id"
  belongs_to :ruta, class_name: "Ruta", foreign_key: "RutaId"
  belongs_to :cliente, class_name: "Cliente", foreign_key: "Cliente"
  belongs_to :motivonoventa, class_name: "Motivonoventa", foreign_key: "MotivoId"


  def self.busqueda_general(params)
   query = .select("noventas.*")
            .where("(noventas.RutaId = :rutaId or :rutaId = '') AND (noventas.CodCliente = :codcliente or :codcliente = '') AND (noventas.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0], codcliente: params[:search2]})
            .distinct
  query = query.where('noventas.Fecha >= ? AND noventas.Fecha <= ?', (params[:search1].to_date).strftime('%Y-%m-%d'), (params[:search2].to_date).strftime('%Y-%m-%d')) if params[:search1].present? and params[:search2].present?
  query
  end

end
