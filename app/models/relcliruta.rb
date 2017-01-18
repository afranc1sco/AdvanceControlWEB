class Relcliruta < ActiveRecord::Base
  self.primary_key = "Id"
  scope :clientes_que_tiene, -> (id_param) { where(IdRuta: id_param) }
  belongs_to :cliente, class_name:"Cliente", foreign_key: "IdCliente"
  belongs_to :ruta, class_name:"Ruta", foreign_key: "IdRuta"

  has_one :reldayc, class_name: "Reldayc", foreign_key: "Id"
  accepts_nested_attributes_for :reldayc


  def self.total_clientes_Ruta(params)
    select("relclirutas.IdRuta")
     .where("(relclirutas.IdRuta = :rutaId or :rutaId = '') AND (relclirutas.IdEmpresa = :idempresa)",{rutaId: params[:search], idempresa: params[:search0]})
  end

end
